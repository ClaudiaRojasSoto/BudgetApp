class Category < ApplicationRecord
  belongs_to :user

  has_many :purchase_categories
  has_many :purchases, through: :purchase_categories

  validates :name, presence: true
  validates :icon, presence: true
  validates :created_at, presence: true
end
