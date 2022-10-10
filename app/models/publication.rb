class Publication < ApplicationRecord
  # belongs_to :project Commented out for file-upload testing
  has_many :researchers, through: :projects

  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
end
