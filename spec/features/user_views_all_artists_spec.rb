require 'rails_helper'

RSpec.feature "User can view all artist" do
  scenario "they see the page for all artists" do
    artist1 = Artist.create(name: "Joe Cocker", image_path: "something")
    artist2 = Artist.create(name: "Mike Ludders", image_path: "something")

    visit artists_path
    expect(page).to have_content artist1.name
    expect(page).to have_content artist2.name

    click_link artist1.name
    visit artists_path
    click_link artist2.name
 end
end
