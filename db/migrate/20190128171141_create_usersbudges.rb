class CreateUsersbudges < ActiveRecord::Migration[5.2]
  def change
    create_table :usersbudges do |t|
      t.integer :user_id
      t.integer :budge_id

      t.timestamps
    end
  end
end
