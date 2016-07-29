json.extract! @match, :id, :p1_score, :p2_score, :winner_id, :live, :page_id, :updated_at
json.player1 @match.player1
json.player2 @match.player2
json.tournament_id @tournament.id
