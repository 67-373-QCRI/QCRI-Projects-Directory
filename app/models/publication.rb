class Publication < ApplicationRecord
  belongs_to :project
  has_many :researchers, through: :projects
  has_one_attached :document
end
