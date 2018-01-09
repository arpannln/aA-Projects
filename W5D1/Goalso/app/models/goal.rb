class Goal < ApplicationRecord
  validates :title, presence: true, length: { minimum: 6 }

  belongs_to :user

  has_many :cheers

  def cheered_by?(user)
    cheers.exists?(giver_id: user.id)
  end

end
