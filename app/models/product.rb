class Product < ApplicationRecord
  belongs_to :project
  has_one_attached :image

  before_save :set_default_image

  private

  def set_default_image
    unless self.image.attached?
      self.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "defaults", "default-project.png")), filename: 'default-project.png' , content_type: "image/png")
    end
  end
end
