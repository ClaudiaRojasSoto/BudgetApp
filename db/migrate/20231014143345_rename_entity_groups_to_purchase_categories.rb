class RenameEntityGroupsToPurchaseCategories < ActiveRecord::Migration[7.0]
  def change
    rename_table :entity_groups, :purchase_categories
  end
end
