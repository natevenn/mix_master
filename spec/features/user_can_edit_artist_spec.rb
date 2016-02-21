require 'rails_helper'

RSpec.feature "User can edit an artist" do
  scenario "they see the edited artist" do
    artist = Artist.create(name: "Bob Marley", image_path: "some path")
    artist_name = "Joe Cocker"
    artist_image_path = "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQU6c7X5uSGNE7pn7vYPe7mG31GNIfCG_PesDpfHwBYar-a3X7i"

    visit artist_path(artist)
    click_on "Edit Artist"

    fill_in "artist_name", with: artist_name
    fill_in "artist_image_path", with: artist_image_path
    click_on "Update Artist"

    expect(page).to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
