require 'capybara/rspec'

describe 'Battle', :type => :feature do

  describe "Homepage" do
    it 'should say "Hello players!!"' do
      visit '/'
      expect(page).to have_content "Hello players!!"
    end
    it 'should display names of the players' do
      visit '/'
      fill_in 'player1', with: "JJ"
      fill_in 'player2', with: "Marie"
      click_button 'Start'
      expect(page).to have_content "JJ vs Marie"
    end
  end
  context ' When starting a game' do
    it 'should display User 2 hitpoints to User 1' do
    visit '/'
    fill_in 'player1', with: 'Cris'
    fill_in 'player2', with: 'JJ'
    click_button 'Start'
    expect(page).to have_content 'Player2 - HP = 10'
    end
  end
end
