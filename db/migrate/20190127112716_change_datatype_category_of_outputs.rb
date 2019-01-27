class ChangeDatatypeCategoryOfOutputs < ActiveRecord::Migration[5.2]
  def change
     change_column :outputs, :category, :string

  end
end
