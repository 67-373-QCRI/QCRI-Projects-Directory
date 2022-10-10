class Product < ApplicationRecord
  belongs_to :project
  has_many :researchers, through: :projects
end
