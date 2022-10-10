require "application_system_test_case"

class ResearchersTest < ApplicationSystemTestCase
  setup do
    @researcher = researchers(:one)
  end

  test "visiting the index" do
    visit researchers_url
    assert_selector "h1", text: "Researchers"
  end

  test "should create researcher" do
    visit researchers_url
    click_on "New researcher"

    click_on "Create Researcher"

    assert_text "Researcher was successfully created"
    click_on "Back"
  end

  test "should update Researcher" do
    visit researcher_url(@researcher)
    click_on "Edit this researcher", match: :first

    click_on "Update Researcher"

    assert_text "Researcher was successfully updated"
    click_on "Back"
  end

  test "should destroy Researcher" do
    visit researcher_url(@researcher)
    click_on "Destroy this researcher", match: :first

    assert_text "Researcher was successfully destroyed"
  end
end
