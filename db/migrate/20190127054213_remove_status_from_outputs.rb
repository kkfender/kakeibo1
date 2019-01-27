class RemoveStatusFromOutputs < ActiveRecord::Migration[5.2]
  def change
    remove_column :outputs, :status, :string
  end
end
