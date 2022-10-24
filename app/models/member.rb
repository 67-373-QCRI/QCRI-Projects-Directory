class Member < ApplicationRecord
  belongs_to :researcher
  belongs_to :project
end
