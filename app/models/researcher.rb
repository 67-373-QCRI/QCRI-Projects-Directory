class Researcher < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :project, optional: true

  has_one_attached :avatar

  before_save :set_default_avatar

  # Scopes
  scope :team_leaders, -> { where(is_leader: true) }
  scope :unassigned, -> { where(project_id: nil) }

  # Methods

  def full_name
    first_name + ' ' + last_name
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
end
