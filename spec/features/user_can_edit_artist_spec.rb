require 'rails_helper'

RSpec.feature "User can edit an artist" do
  scenario "they see the edited artist" do
    artist = Artist.create(name: "Bob Marley", image_path: "some path")
    artist_name = "Joe Cocker"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    visit artist_path(artist)
    click_on "Edit Artist"

    fill_in "artist_name", with: artist_name
    fill_in "artist_image_path", with: artist_image_path
    click_on "Update Artist"

    expect(page).to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
