class RenameEntityToPurchase < ActiveRecord::Migration[7.0]
  def change
    rename_table :entities, :purchases
  end
end
