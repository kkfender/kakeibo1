class AddRevenueItemToOutputs < ActiveRecord::Migration[5.2]
  def change
    add_column :outputs, :revenue_item, :string
  end
end
