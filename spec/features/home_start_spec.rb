RSpec.feature 'Home Start Page', type: :feature do
  scenario "muestra el título 'WELCOME!!'" do
    visit home_start_path

    expect(page).to have_selector('h1.start-title', text: 'WELCOME!!')
  end

  scenario "muestra un enlace 'START'" do
    visit home_start_path

    expect(page).to have_link('START', href: categories_path)
  end
end
