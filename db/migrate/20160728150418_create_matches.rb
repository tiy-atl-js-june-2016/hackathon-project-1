class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :player1_id
      t.integer :player2_id
      t.integer :tournament_id
      t.integer :winner_id
      t.integer :p1_score
      t.integer :p2_score

      t.timestamps
    end
  end
end
