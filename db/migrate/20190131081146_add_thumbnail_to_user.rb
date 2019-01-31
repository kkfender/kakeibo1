class AddThumbnailToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :thumbnail, :string
  end
end
