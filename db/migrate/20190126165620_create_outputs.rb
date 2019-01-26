class CreateOutputs < ActiveRecord::Migration[5.2]
  def change
    create_table :outputs do |t|
      t.date :date
      t.integer :name_id
      t.string :shop_id
      t.integer :widtdrawl
      t.integer :category
      t.integer :deposit
      t.string :reason
      t.string :memo
      t.integer :user_id

      t.timestamps
    end
  end
end
