require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  scenario 'User sees categories index' do
    create_list(:category, 3, user: user)
    visit categories_path
    expect(page).to have_text('MyCategory')
  end

  scenario 'User visits new category page' do
    visit new_category_path
    expect(page).to have_text('ADD CATEGORY')
  end

  scenario 'User creates a new category' do
    visit new_category_path
    fill_in 'Name', with: 'New Category'

    # Wait for the file input field to become visible
    find('input[type="file"][name="category[icon]"]', visible: :all).attach_file(Rails.root.join('spec', 'support', 'assets', 'test_icon.png'))

    click_button 'CREATE'
    expect(page).to have_text('New Category')
  end
end
