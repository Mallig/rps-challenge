# Feature test for Rock, Paper, Scissors app

require './app'

feature 'Rock, Paper, Scissors game' do

  scenario 'welcomes a user to the page' do
    visit('/')
    expect(page).to have_content 'Welcome'
  end

  scenario 'allows user to decide wether to start a game' do
    visit('/')
    expect(page).to have_content 'Would you like to begin?'
    find_link('Yes!').visible?
    find_link('No').visible?
  end

  scenario 'takes the user to a registration page' do
    visit('/')
    click_link('Yes!')
    expect(page).to have_current_path('/register')
  end

  scenario 'takes the user to an end page' do
    visit('/')
    click_link('No')
    expect(page).to have_current_path('/goodbye')
  end

  scenario 'allows a player to enter their name and title' do
    visit('/')
    click_link('Yes!')
    fill_in('name', with: 'Hamish')
    fill_in('title', with: 'Destroyer')
    click_button('Submit')
    expect(page).to have_content 'Hamish the Destroyer'
  end

end
