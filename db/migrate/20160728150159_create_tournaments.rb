class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments do |t|
      t.string :title
      t.integer :size
      t.string :location
      t.datetime :deadline

      t.timestamps
    end
  end
end
