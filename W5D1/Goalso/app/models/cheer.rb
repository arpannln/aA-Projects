class Cheer < ApplicationRecord
  validates :goal_id, uniqueness: { scope: :user_id } #one user cant cheer on a goal multiple times 

  belongs_to :user
  belongs_to :goal
end
