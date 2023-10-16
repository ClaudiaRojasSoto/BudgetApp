class Category < ApplicationRecord
  belongs_to :user

  has_many :purchase_categories
  has_many :purchases, through: :purchase_categories

  has_one_attached :icon

  validates :name, presence: true
  validates :icon, presence: true

  def category_total
    # Sumar los montos de todas las compras asociadas a esta categoría
    purchases.sum(:amount)
  end
end
