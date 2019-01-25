class CreateIntputs < ActiveRecord::Migration[5.2]
  def change
    create_table :intputs do |t|
      t.date :date
      t.integer :name_id
      t.string :shop_name
      t.integer :deposit
      t.integer :category
      t.string :reason
      t.string :memo
      t.string :user_id

      t.timestamps
    end
  end
end
