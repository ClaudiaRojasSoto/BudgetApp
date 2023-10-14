class Purchase < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'

  has_many :purchase_categories
  has_many :categories, through: :purchase_categories

  validates :name, presence: true
  validates :amount, presence: true
  validates :created_at, presence: true
end
