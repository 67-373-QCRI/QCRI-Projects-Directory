class Researcher < ApplicationRecord
  has_many :projects

  # Methods

  def full_name
    first_name + ' ' + last_name
  end
end
