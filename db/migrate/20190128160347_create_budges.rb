class CreateBudges < ActiveRecord::Migration[5.2]
  def change
    create_table :budges do |t|
      t.integer :user_id
      t.string :budge_name

      t.timestamps
    end
  end
end
