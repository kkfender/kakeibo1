class AddMonthlyBudgetToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :monthly_budget, :integer
  end
end
