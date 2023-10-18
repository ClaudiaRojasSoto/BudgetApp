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
end
