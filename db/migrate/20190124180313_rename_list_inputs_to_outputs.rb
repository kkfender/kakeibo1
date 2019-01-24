class RenameListInputsToOutputs < ActiveRecord::Migration[5.2]
  def change
       rename_table :inputs, :outputs 
  end
end
