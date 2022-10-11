class Publication < ApplicationRecord
  # Relationships
  belongs_to :project
  has_many :researchers, through: :projects

  # Uploader
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.

  # Validations
  validates :title, presence: true
  validates :authors, length: { minimum: 1 }
  validates :published, comparison: { less_than_or_equal_to: Date.current }

  # Scopes
  scope :for_project -> (project_id) { where("project_id = ?", project_id) }


end
