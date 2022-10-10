class Project < ApplicationRecord
  has_many :products
  has_many :publications
end
