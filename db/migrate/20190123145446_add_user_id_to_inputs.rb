class AddUserIdToInputs < ActiveRecord::Migration[5.2]
  def change
    add_column :inputs, :user_id, :string
  end
end
