class Researcher < ApplicationRecord
  has_many :projects

  # Scopes
  scope :team_leaders, -> { where(is_leader: true) }

  # Methods

  def full_name
    first_name + ' ' + last_name
  end

  def to_label
    "#{first_name} #{last_name}"
  end
end
