class AddMetadataToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :live, :boolean, default: false
    add_column :matches, :page_id, :string
  end
end
