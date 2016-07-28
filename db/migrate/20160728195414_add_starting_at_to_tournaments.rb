class AddStartingAtToTournaments < ActiveRecord::Migration[5.0]
  def change
    add_column :tournaments, :starting_at, :datetime
  end
end
