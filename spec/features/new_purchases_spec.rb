RSpec.feature 'Transaction Form Page', type: :feature do
    let!(:category) { create(:category, user: user) }
    let(:user) { create(:user) }
  
    before do
      login_as(user, scope: :user)
      visit new_purchase_path
    end
  
    scenario 'displays the transaction form' do
      expect(page).to have_content('Add Transaction')
      expect(page).to have_content('Select category(s)')
    end
  
    scenario 'creates a new transaction' do
      fill_in 'Name', with: 'New Transaction'
      fill_in 'Amount', with: 100
      # Select the first category in the list
      select category.name, from: 'purchase[category_ids][]'
      click_button 'Save'
  
      expect(page).to have_content('Purchase was successfully created.')
    end
  
    scenario 'displays validation errors when creating a transaction with missing information' do
      click_button 'Save'
  
      expect(page).to have_content("Name can't be blank")
    end
  end
  