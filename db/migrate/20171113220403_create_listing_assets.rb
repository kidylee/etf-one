class CreateListingAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :listing_assets do |t|
      t.string :name

      t.timestamps
    end
  end
end
