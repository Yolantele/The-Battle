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
      expect(page).to have_content "JJ - HP = 100 vs Marie"
    end
  end
  context 'When starting a game' do
    it 'should display User 2 hitpoints to User 1' do
      sign_in_and_play
      expect(page).to have_content 'Marie - HP = 100'
    end
    it 'should display User 2 hitpoints to User 1' do
      sign_in_and_play
      expect(page).to have_content 'Marie - HP = 100'
    end
  end

  context 'When attacking a player' do
    it 'Should have a confirmation' do
      sign_in_and_play
      click_button 'Attack'
      expect(page).to have_content "You've attacked Marie"
    end
    it 'Should have a confirmation' do
      sign_in_and_play
      2.times { click_button 'Attack' }
      expect(page).to have_content "You've attacked JJ"
    end

    it 'should reduces player 2 HP by 10 ' do
      sign_in_and_play
      click_button 'Attack'
      expect(page).to have_content 'Marie - HP = 90'
    end
    it 'should reduces player 1 HP by 10' do
      sign_in_and_play
      2.times { click_button 'Attack' }
      expect(page).to have_content 'JJ - HP = 90'
    end
  end

  context 'when switching after attack' do
    it 'should print other players turn  after attack' do
      sign_in_and_play
      click_button 'Attack'
      expect(page).to have_content "Marie's turn!"
    end
    it 'should switch players' do
      sign_in_and_play
      2.times { click_button 'Attack' }
      expect(page).to have_content "JJ's turn!"
    end
  end

  context 'when losing a game' do
    it 'Should show a lose message for player 2' do
      sign_in_and_play
      19.times { click_button 'Attack' }
      expect(page).to have_content "Marie you've lost"
    end

    it 'Should show a lose message for player 1' do
      sign_in_and_play
      20.times { click_button 'Attack' }
      expect(page).to have_content "JJ you've lost"
    end
  end
end
