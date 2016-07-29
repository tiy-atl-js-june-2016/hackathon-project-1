class Tournament < ApplicationRecord
  belongs_to :organizer, class_name: "User", foreign_key: :user_id
  has_many :competitors
  has_many :players, through: :competitors
  has_many :matches

  validates :title, presence: true,
            uniqueness: { scope: :user_id }
  validates :size, presence: true,
            inclusion: { in: [4,8,12,16,20,24,28,32] }
end
