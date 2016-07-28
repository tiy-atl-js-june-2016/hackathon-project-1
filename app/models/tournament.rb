class Tournament < ApplicationRecord
  belongs_to :organizer, class_name: :user
  has_many :competitors
  has_many :players, through: :competitors

  validates :title, presence: true,
            uniqueness: { scope: :user_id }
  validates :size, presence: true,
            inclusion: { in: [4,8,12,16,20,24,28,32] }
end
