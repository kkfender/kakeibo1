class AddWithdrawlToOutputs < ActiveRecord::Migration[5.2]
  def change
    add_column :outputs, :withdrawal, :integer
  end
end
