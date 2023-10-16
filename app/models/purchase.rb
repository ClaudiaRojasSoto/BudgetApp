class Purchase < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  has_many :purchase_categories
  has_many :categories, through: :purchase_categories

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :created_at, presence: true
end
