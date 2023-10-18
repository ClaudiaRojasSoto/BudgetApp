class Purchase < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  has_many :purchase_categories
  has_many :categories, through: :purchase_categories

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :created_at, presence: true
  validate :at_least_one_category

  private

  def at_least_one_category
    return unless categories.empty?

    errors.add(:categories, 'must have at least one category')
  end
end
