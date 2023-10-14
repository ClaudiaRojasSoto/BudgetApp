class RenameAuthorIdInPurchases < ActiveRecord::Migration[7.0]
  def change
    rename_column :purchases, :author_id, :user_id
  end
end
