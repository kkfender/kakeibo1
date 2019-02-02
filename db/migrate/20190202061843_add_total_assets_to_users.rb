class AddTotalAssetsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :total_asets, :integer
  end
end
