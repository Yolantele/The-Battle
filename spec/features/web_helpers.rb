def sign_in_and_play
  visit '/'
  fill_in 'player1', with: "JJ"
  fill_in 'player2', with: "Marie"
  click_button 'Start'
end
