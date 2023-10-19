class PurchaseCategory < ApplicationRecord
  belongs_to :purchase
  belongs_to :category
end
