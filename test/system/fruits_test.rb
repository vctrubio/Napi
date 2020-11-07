require "application_system_test_case"

class FruitsTest < ApplicationSystemTestCase
  setup do
    @fruit = fruits(:one)
  end

  test "visiting the index" do
    visit fruits_url
    assert_selector "h1", text: "Fruits"
  end

  test "creating a Fruit" do
    visit fruits_url
    click_on "New Fruit"

    fill_in "Comment", with: @fruit.comment
    fill_in "Name", with: @fruit.name
    fill_in "Pricea", with: @fruit.priceA
    fill_in "Priceb", with: @fruit.priceB
    fill_in "Pricec", with: @fruit.priceC
    click_on "Create Fruit"

    assert_text "Fruit was successfully created"
    click_on "Back"
  end

  test "updating a Fruit" do
    visit fruits_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @fruit.comment
    fill_in "Name", with: @fruit.name
    fill_in "Pricea", with: @fruit.priceA
    fill_in "Priceb", with: @fruit.priceB
    fill_in "Pricec", with: @fruit.priceC
    click_on "Update Fruit"

    assert_text "Fruit was successfully updated"
    click_on "Back"
  end

  test "destroying a Fruit" do
    visit fruits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fruit was successfully destroyed"
  end
end
