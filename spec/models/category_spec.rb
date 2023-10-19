require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should belong_to(:user) }

  it { should validate_presence_of(:name) }

  describe 'icon attachments' do
    it 'should have icon attached' do
      user = create(:user)
      category = create(:category, user: user)

      expect(category.icon).to be_attached
    end
  end
end
