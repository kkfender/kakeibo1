class ChangeDatatypeUserIdOfInputs < ActiveRecord::Migration[5.2]
  def change
      change_column :outputs, :user_id, :integer

  end
end
