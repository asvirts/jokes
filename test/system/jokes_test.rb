require "application_system_test_case"

class JokesTest < ApplicationSystemTestCase
  setup do
    @joke = jokes(:first) # Reference to the first fixture joke
  end
  
  test "Creating a new joke" do
    # When we visit the Jokes#index page
    # we expect to see a title with the text "Jokes"
    visit jokes_path
    assert_selector "h1", text: "Jokes"

    # When we click on the link with the text "New joke"
    # we expect to land on a page with the title "New joke"
    click_on "New joke"
    assert_selector "h1", text: "New joke"

    # When we fill in the name input with "Capybara joke"
    # and we click on "Create Joke"
    fill_in "Name", with: "Capybara joke"
    click_on "Create joke"

    # We expect to be back on the page with the title "Jokes"
    # and to see our "Capybara joke" added to the list
    assert_selector "h1", text: "Jokes"
    assert_text "Capybara joke"
  end

    test "Showing a joke" do
    visit jokes_path
    click_link @joke.name

    assert_selector "h1", text: @joke.name
  end

  test "Updating a joke" do
    visit jokes_path
    assert_selector "h1", text: "jokes"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit joke"

    fill_in "Name", with: "Updated joke"
    click_on "Update joke"

    assert_selector "h1", text: "jokes"
    assert_text "Updated joke"
  end

  test "Destroying a joke" do
    visit jokes_path
    assert_text @joke.name

    click_on "Delete", match: :first
    assert_no_text @joke.name
  end
end