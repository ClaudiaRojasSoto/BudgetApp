class RenameGroupToCategory < ActiveRecord::Migration[7.0]
  def change
    rename_table :groups, :categories
  end
end
