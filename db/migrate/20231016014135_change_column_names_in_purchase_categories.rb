class ChangeColumnNamesInPurchaseCategories < ActiveRecord::Migration[7.0]
  def change
    rename_column :purchase_categories, :entity_id, :purchase_id
    rename_column :purchase_categories, :group_id, :category_id
  end
end
