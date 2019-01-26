class AddMonthlySavingsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :monthly_savings, :integer
  end
end
