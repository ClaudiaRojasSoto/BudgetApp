require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  context 'Validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without a full_name' do
      user.full_name = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without a password' do
      user.password = nil
      expect(user).to_not be_valid
    end

    it 'is not valid if the full_name is less than two words' do
      user.full_name = 'John'
      expect(user).to_not be_valid
    end
  end

  context 'Associations' do
    it 'has many purchases' do
      assc = described_class.reflect_on_association(:purchases)
      expect(assc.macro).to eq :has_many
    end

    it 'has many categories' do
      assc = described_class.reflect_on_association(:categories)
      expect(assc.macro).to eq :has_many
    end
  end
end
