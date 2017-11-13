class CreateAssetHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :asset_histories do |t|
      t.string :asset_type
      t.decimal :amount, precision: 36, scale: 18
      t.string :action_type
      t.string :created_by
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :asset_histories, :asset_type
  end
end
