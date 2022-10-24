class Researcher < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :project, optional: true

  # Scopes
  scope :team_leaders, -> { where(is_leader: true) }
  scope :unassigned, -> { where(project_id: nil) }

  # Methods

  def full_name
    first_name + ' ' + last_name
  end

  def to_label
    "#{first_name} #{last_name}"
  end
end
