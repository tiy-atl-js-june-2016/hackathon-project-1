class Tournament < ApplicationRecord
  belongs_to :user

  validates :title, presence: true,
            uniqueness: { scope: :user_id }
  validates :size, presence: true,
            inclusion: { in: [4,8,12,16,20,24,28,32] }
end
