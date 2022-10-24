class Project < ApplicationRecord
  include AppHelpers::Deletions
  include AppHelpers::Activeable::InstanceMethods
  extend AppHelpers::Activeable::ClassMethods

  # Relationships
  has_many :publications
  has_many :members
  has_many :researchers, through: :members
  has_one_attached :image
  accepts_nested_attributes_for :publications, :reject_if => :all_blank, :allow_destroy => true
  belongs_to :team_leader, class_name: "Researcher", optional: true # OPTIONAL ONLY FOR DEV PURPOSES

  # Validations
  validates :team_leader, presence: true
  validates :start_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }, allow_nil: true

  # Custom Validations
  validate :attachment_filetypes

  # Scopes
  scope :planned, -> { where("start_date > ?", Date.current) }
  scope :ongoing, -> { where(end_date: nil) }
  scope :complete, -> { where.not(end_date: nil) }
  scope :led_by, -> (team_leader_id) { where(team_leader_id: team_leader_id) }
  scope :search, ->(term) { where('name LIKE ?', "#{term}%") }

  # Methods
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
    self.members
  end

  # Private Methods
  private

  def attachment_filetypes
    return unless image.attached?

    unless image.content_type.in?(%w[image/jpeg image/jpg image/png])
      errors.add(:image, "must be JPG, JPEG, or PNG file")
    end
  end


end
