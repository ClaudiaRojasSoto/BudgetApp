require 'rails_helper'

RSpec.feature 'Purchases', type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  scenario 'User creates a new purchase' do
    create(:category, user: user, name: 'Category Name')
    visit new_purchase_path
    fill_in 'Name', with: 'New Purchase'
    fill_in 'Amount', with: '100'
    select 'Category Name', from: 'purchase_category_ids'
    click_button 'Save'
    expect(page).to have_text('New Purchase')
  end

  scenario 'User sees purchases index for a category' do
    category = create(:category, user: user)
    create_list(:purchase, 3, user: user, categories: [category])
    visit purchases_path(category_id: category.id)
    expect(page).to have_text('MyPurchase', count: 3)
  end
end
