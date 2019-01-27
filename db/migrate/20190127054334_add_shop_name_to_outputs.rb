class AddShopNameToOutputs < ActiveRecord::Migration[5.2]
  def change
    add_column :outputs, :shop_name, :string
  end
end
