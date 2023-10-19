# spec/models/purchase_spec.rb
require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it 'is not valid without a name' do
    purchase = build(:purchase, name: nil)
    expect(purchase).to_not be_valid
  end

  it 'is not valid without an amount' do
    purchase = build(:purchase, amount: nil)
    expect(purchase).to_not be_valid
  end

  it 'is not valid with a non-positive amount' do
    purchase = build(:purchase, amount: -1)
    expect(purchase).to_not be_valid
  end

  it 'is not valid without a created_at' do
    purchase = build(:purchase, created_at: nil)
    expect(purchase).to_not be_valid
  end

  describe 'Associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it 'has many categories' do
      association = described_class.reflect_on_association(:categories)
      expect(association.macro).to eq :has_many
    end
  end

  describe 'Custom Validation' do
    it 'requires at least one category' do
      purchase = build(:purchase, :with_categories, categories_count: 0)
      expect(purchase).to_not be_valid
    end
  end
end
