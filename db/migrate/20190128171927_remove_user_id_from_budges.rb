class RemoveUserIdFromBudges < ActiveRecord::Migration[5.2]
  def change
    remove_column :budges, :user_id, :integer
  end
end
