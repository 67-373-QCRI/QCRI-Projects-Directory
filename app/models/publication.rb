class Publication < ApplicationRecord
  belongs_to :project
  has_many :researchers, through: :projects
  has_one_attached :document

  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
end
