RSpec.feature 'Categories Page', type: :feature do
  let(:user) { create(:user) }
  let!(:category1) { create(:category, user: user) }
  let!(:category2) { create(:category, user: user) }
  let(:total_purchases) { 1000 }

  before do
    allow(user).to receive_message_chain(:purchases, :pluck, :sum).and_return(total_purchases)
    login_as(user, scope: :user)
    visit categories_path
  end

  scenario 'muestra el número total de compras de usuario' do
    expect(page).to have_text(total_purchases.to_s)
  end

  scenario 'muestra las categorías' do
    expect(page).to have_text(category1.name)
    expect(page).to have_text(category2.name)
  end

  scenario 'muestra los enlaces de navegación' do
    expect(page).to have_css('i.fa-solid.fa-arrow-left')
    expect(page).to have_link('NEW CATEGORY', href: new_category_path)
  end

  scenario 'muestra los botones de ordenar' do
    expect(page).to have_text('Most recent', wait: 5)
    expect(page).to have_text('Most ancient', wait: 5)
  end
end
