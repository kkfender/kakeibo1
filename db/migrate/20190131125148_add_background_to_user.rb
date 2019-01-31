class AddBackgroundToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :background, :string
  end
end
