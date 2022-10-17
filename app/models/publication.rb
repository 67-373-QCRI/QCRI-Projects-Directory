class Publication < ApplicationRecord
  # Relationships
  belongs_to :project, optional: true # Optional only for development

  # Uploader
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.

  # Validations
  validates :title, presence: true
  # validates :authors, length: { minimum: 1 }, allow_nil: true COMMENTED OUT FOR DEV
  validates :published_on, comparison: { less_than_or_equal_to: Date.current }, allow_nil: true

  # Scopes
  scope :for_project, -> (project_id) { where('project_id = ?', project_id) }
  scope :search, -> (term) { where('title LIKE ?', "#{term}%") }
  scope :by_published, -> { where(published: true) }
  scope :chronological, -> { order('published_on DESC') }


end
