class Researcher < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :project, optional: true

  has_one_attached :avatar

  before_save :set_default_avatar

  before_destroy :remove_researcher_from_projects

  # Validations
  validates :first_name, presence: true, format: { with: /\A^[A-Za-z]+$\z/, message: "First name can only contain letters from A-Z" }
  validates :last_name, presence: true, format: { with: /\A^[A-Za-z]+$\z/, message: "Last name can only contain letters from A-Z" }

  validates :website_url, format: { with: /\A^(https?:\/\/)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&\/\/=]*)$\z/, message: "Website URL invalid" }, allow_blank: true
  validates :google_scholar_url, format: { with: /\A^(https:\/\/scholar.google.com\/citations\?user=|scholar.google.com\/citations\?user=)[\w\d\-]+\z/, message: "Google Scholar URL invalid" }, allow_blank: true

  # Scopes
  scope :team_leaders, -> { where(is_leader: true) }
  scope :unassigned, -> { where(project_id: nil) }

  # Methods

  def full_name
    first_name.capitalize + ' ' + last_name.capitalize
  end

  def github
    "https://www.github.com/" + self.github_url.strip
  end

  def past_projects
    if self.project_id.nil?
      Project.where("? = ANY (members)", self.id)
    else
      Project.where.not(id: self.project_id).where("? = ANY (members)", self.id)
    end
  end

  def to_label
    "#{first_name} #{last_name}"
  end

  # Private Methods

  private

  def set_default_avatar
    unless self.avatar.attached?
      self.avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "defaults", "default-researcher.png")), filename: 'default-researcher.png' , content_type: "image/png")
    end
  end

  def remove_researcher_from_projects
    all_projects = Project.where('(? = ANY (members)) OR team_leader_id = ?', self.id, self.id)
    for project in all_projects
      if project.team_leader_id == self.id
        unless project.researchers.nil?
          for researcher in project.researchers
            researcher.update_attribute(:project_id, nil)
            researcher.save!
          end
        end
        project.destroy!
        return
      end
      if project.members.include?(self.id)
        project.members.delete(self.id)
      end
      project.save!
    end
  end

end
