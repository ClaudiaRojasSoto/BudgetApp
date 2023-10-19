require 'rails_helper'

RSpec.feature 'Purchase Index Page', type: :feature do
  let(:category) { create(:category) }
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
    visit purchases_path(category_id: category.id)
  end

  scenario 'displays the category name' do
    expect(page).to have_content(category.name)
  end

  scenario 'displays "Most recent" and "Most ancient" buttons' do
    expect(page).to have_text('Most recent')
    expect(page).to have_text('Most ancient')
  end

  scenario 'displays the total amount' do
    expect(page).to have_content(category.category_total)
  end

  scenario 'displays a list of transactions' do
    purchases = category.purchases.order(created_at: :desc)

    purchases.each do |purchase|
      expect(page).to have_content(purchase.name)
      expect(page).to have_content(purchase.amount)
      expect(page).to have_content(purchase.created_at.strftime('%B %d, %Y %I:%M %p'))
    end
  end

  scenario 'displays "Add a New Transaction" button' do
    expect(page).to have_link('Add a New Transaction', href: new_purchase_path)
  end
end
