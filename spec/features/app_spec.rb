require 'capybara/rspec'
require './spec/features/web_helpers'

describe 'Battle', :type => :feature do

  describe "Homepage" do
    it 'should say "Hello players!!"' do
      visit '/'
      expect(page).to have_content "Hello players!!"
    end
    it 'should display names of the players' do
      sign_in_and_play
      expect(page).to have_content "JJ vs Marie"
    end
  end
  context 'When starting a game' do
    it 'should display User 2 hitpoints to User 1' do
    sign_in_and_play
    expect(page).to have_content 'Player2 - HP = 10'
    end
  end

  context 'When attacking a player' do
    it 'Should have a confirmation' do
      sign_in_and_play
      click_button 'Attack'
      expect(page).to have_content "You've attacked Marie"
    end
  end

end
