class AddUniqueIndexToAssets < ActiveRecord::Migration[5.1]
  def change
    add_index :assets, [:symbol, :user_id], :unique => true
  end
end
