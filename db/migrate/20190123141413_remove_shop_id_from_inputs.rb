class RemoveShopIdFromInputs < ActiveRecord::Migration[5.2]
  def change
    remove_column :inputs, :shop_id, :Integer
  end
end
