class AddShopNameToInputs < ActiveRecord::Migration[5.2]
  def change
    add_column :inputs, :shop_name, :string
  end
end
