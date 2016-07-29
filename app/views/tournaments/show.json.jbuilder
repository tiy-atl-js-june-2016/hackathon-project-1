json.extract! @tournament, :id, :title, :size, :location, :deadline, :starting_at
json.matches @tournament.matches do |match|
  json.extract! match, :id, :p1_score, :p2_score, :live, :page_id, :winner_id
  json.player1 match.player1
  json.player2 match.player2
end
json.organizer @tournament.organizer.username
json.players @tournament.players
