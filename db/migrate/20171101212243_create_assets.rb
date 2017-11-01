class CreateAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :assets do |t|
      t.string :symbol
      t.decimal :amount, precision:18, scale:18
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
