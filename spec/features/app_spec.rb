require 'capybara/rspec'

describe Battle do

  describe "Homepage", :type => :feature do
    it 'should say "Hello players!!"' do
      visit '/'
      expect(page).to have_content "Hello players!!"
    end
    it 'should display names of the players' do
      visit '/'
      fill_in 'player1', with: "JJ"
      fill_in 'player2', with: "Marie"
      click_button 'Save'
      expect(page).to have_content "JJ"
    end
  end
end
