require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "p", count: 10
  end

  test 'letters not in grid will result in failur' do
    visit new_url
    fill_in 'word', with: 'fdadsrad'
    click_on 'Answer'
  end
end
