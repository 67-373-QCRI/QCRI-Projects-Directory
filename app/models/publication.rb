class Publication < ApplicationRecord
  # Relationships
  belongs_to :project
  has_one_attached :document
  # # Uploader
  # mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.

  # Validations
  validates :title, presence: true
  # validates :authors, length: { minimum: 1 }, allow_nil: true COMMENTED OUT FOR DEV
  validates :published_on, comparison: { less_than_or_equal_to: Date.current }, allow_nil: true

  # Scopes
  scope :for_project, -> (project_id) { where('project_id = ?', project_id) }
  scope :search, -> (term) { where('title LIKE ?', "#{term}%") }
  scope :by_published, -> { where(published: true) }
  scope :chronological, -> { order('published_on DESC') }

  def authors_citation
    name_array = self.project.member_names.map { |name| name.gsub(/[\w-]+\s*/){|s| ($'.empty? ? s : "#{s[0]}. ").capitalize} }
    name_array.join(", ")
  end

  def pages
    self.page_from.to_s + "-" + self.page_to.to_s
  end

  def doi_to_url
    unless self.doi.nil?
      "https://doi.org/" + self.doi
    end
  end


end
