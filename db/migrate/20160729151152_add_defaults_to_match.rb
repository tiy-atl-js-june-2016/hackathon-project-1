class AddDefaultsToMatch < ActiveRecord::Migration[5.0]
  def change
    change_column_default :matches, :p1_score, from: nil, to: 0
    change_column_default :matches, :p2_score, from: nil, to: 0
  end
end
