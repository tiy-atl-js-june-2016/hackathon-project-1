class Match < ApplicationRecord
  belongs_to :player1, class_name: :player,
             optional: true
  belongs_to :player2, class_name: :player,
             optional: true
  belongs_to :tournament
end
