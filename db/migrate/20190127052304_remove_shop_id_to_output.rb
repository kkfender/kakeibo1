class RemoveShopIdToOutput < ActiveRecord::Migration[5.2]
  
  def change
    remove_column  :outputs,:shop_id, :integer
  end
end
