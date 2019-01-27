class RenameWidtdrawlColumnToOutputs < ActiveRecord::Migration[5.2]
    rename_column :outputs, :widtdrawl, :withdrawal

  def change
  end
end
