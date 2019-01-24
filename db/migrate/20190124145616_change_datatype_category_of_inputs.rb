class ChangeDatatypeCategoryOfInputs < ActiveRecord::Migration[5.2]
  def change
       change_column :inputs, :category, :string

  end
end
