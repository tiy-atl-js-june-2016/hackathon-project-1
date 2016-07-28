class CreateCompetitors < ActiveRecord::Migration[5.0]
  def change
    create_table :competitors do |t|
      t.integer :player_id
      t.integer :tournament_id

      t.timestamps
    end
  end
end
