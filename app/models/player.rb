class Player < ApplicationRecord
  validates :nickname, presence: true, uniqueness: true
  validates :fullname, presence: true
end
