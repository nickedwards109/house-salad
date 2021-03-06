require 'rails_helper'

RSpec.describe "User gets members of the house" do
  scenario "user gets all 7 members of the Colorado House of Representatives" do
    visit root_path
    select "Colorado", from: "state"
    click_on "Locate Members of the House"

    expect(page).to have_current_path(search_path, only_path: true)
    expect(page).to have_content("7 Results")
    expect(page).to have_selector(".house-member", count: 7)
    expect(page).to have_selector(".name", count: 7)
    expect(page).to have_selector(".role", count: 7)
    expect(page).to have_selector(".party", count: 7)
    expect(page).to have_selector(".district", count: 7)
  end
end
