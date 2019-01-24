class DestroyExpenses < ActiveRecord::Migration[5.2]
  def change
    drop_table :expenses
  end
end
