RSpec.feature 'Home Index Page', type: :feature do
  scenario "muestra el título 'BudgeTracker'" do
    visit root_path

    expect(page).to have_selector('h1.start-title', text: 'BudgeTracker')
  end

  scenario "muestra un enlace 'LOG IN'" do
    visit root_path

    expect(page).to have_link('LOG IN', href: new_user_session_path)
  end

  scenario "muestra un enlace 'SIGN UP'" do
    visit root_path

    expect(page).to have_link('SIGN UP', href: new_user_registration_path)
  end
end
