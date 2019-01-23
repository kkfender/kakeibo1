class RenameWidtdrawlColumnToInputs < ActiveRecord::Migration[5.2]
  def change
     rename_column :inputs, :widtdrawl, :withdrawal

  end
end
