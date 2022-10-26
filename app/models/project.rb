class Project < ApplicationRecord
  include AppHelpers::Deletions
  include AppHelpers::Activeable::InstanceMethods
  extend AppHelpers::Activeable::ClassMethods

  attr_accessor :skip_save_callback

  # Callbacks
  before_create :ensure_leader_is_member, :assign_leader_to_project
  after_save :store_member_ids, :unassign_members, unless: :skip_save_callback


  before_save :set_default_image

  # Relationships
  has_many :publications
  has_many :researchers
  has_one_attached :image
  accepts_nested_attributes_for :publications, :reject_if => :all_blank, :allow_destroy => true

  # Validations
  validates :team_leader_id, presence: true
  validates :start_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }, allow_nil: true

  # Custom Validations
  validate :attachment_filetypes
  validate :team_leader_exists
  validate :team_leader_available

  # Scopes
  scope :planned, -> { where("start_date > ?", Date.current) }
  scope :ongoing, -> { where(end_date: nil) }
  scope :complete, -> { where.not(end_date: nil) }
  scope :led_by, -> (team_leader_id) { where(team_leader_id: team_leader_id) }
  scope :search, -> (term) { where('name LIKE ?', "#{term}%") }
  scope :for_researcher, -> (r_id) { joins(:researchers).where(researcher_id: r_id) }

  # Methods
  def team_leader
    Researcher.find(self.team_leader_id)
  end

  def leader_name
    self.team_leader.full_name
  end

  def status
    if self.start_date > Date.current
      return "Planned"
    end
    self.end_date.nil? ? "Ongoing" : "Complete"
  end

  def list_members
    self.researchers
  end

  # Private Methods
  private

  def attachment_filetypes
    return unless image.attached?

    unless image.content_type.in?(%w[image/jpeg image/jpg image/png])
      errors.add(:image, "must be JPG, JPEG, or PNG file")
    end
  end

  def team_leader_exists
    if (self.team_leader_id.nil?) || (self.team_leader_id_changed?)
      Researcher.exists?(self.team_leader_id)
    end
  end

  def team_leader_available
    available = Project.where(team_leader_id: self.team_leader_id)
  end

  def ensure_leader_is_member
    unless self.researcher_ids.include?(self.team_leader_id)
      self.researchers << Researcher.find(self.team_leader_id)
    end
  end

  def assign_leader_to_project
    r = Researcher.find(self.team_leader_id)
    r.update_attribute(:project_id, self.id)
    r.save!
  end

  def unassign_members
    unless self.end_date.nil?
      self.researchers.each do |r|
        r.update_attribute(:project_id, nil)
        r.save!
      end
    end
  end

  def set_default_image
    unless self.image.attached?
      self.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "defaults", "default-project.png")), filename: 'default-project.png' , content_type: "image/png")
    end
  end

  def store_member_ids
    self.update_column(:members, self.researcher_ids)
  end





end
