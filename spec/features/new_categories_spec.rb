RSpec.feature 'Categories Page', type: :feature do
  let!(:user) { create(:user) }
  let!(:categories) { create_list(:category, 3, user: user) }
  let!(:total_purchases) { 0 }

  before do
    login_as(user, scope: :user)
    visit categories_path
  end

  scenario "muestra el título 'CATEGORIES'" do
    expect(page).to have_selector('h2#login-title', text: 'CATEGORIES')
  end

  scenario 'muestra el número total de compras de usuario' do
    expect(page).to have_text('Gift credit')
    expect(page).to have_text(total_purchases.to_s)
  end

  scenario "contiene un enlace 'NEW CATEGORY'" do
    expect(page).to have_link('NEW CATEGORY', href: new_category_path)
  end
end
