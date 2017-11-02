class ChangeAssetAmountToNumeric < ActiveRecord::Migration[5.1]
  def change
    change_column :assets, :amount, :decimal, precision:36, scale:18
  end
end
