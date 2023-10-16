require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it 'is valid with valid attributes' do
    purchase = build(:purchase)
    expect(purchase).to be_valid
  end

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
    it 'has many categories' do
      purchase = create(:purchase, :with_categories)
      expect(purchase.categories.length).to eq 3
    end
  end
end
