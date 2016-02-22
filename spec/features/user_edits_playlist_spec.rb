require 'rails_helper'

RSpec.feature "User can edit a playlist" do
  scenario "User can see the edited playlist" do
    playlist1 = create(:playlist_with_songs)
    song_one, song_two, song_three = playlist1.songs
    song_four = create(:song, title: "New Song")

    visit playlist_path(playlist1)

    click_on "Edit"
    fill_in "playlist_name", with: "New Jams"
    uncheck("song-#{song_one.id}")
    check("song-#{song_four.id}")
    click_on "Update Playlist"

    expect(page).to have_content "New Jams"

    within("ul") do
     expect(page).to have_content song_two.title
     expect(page).to have_content song_three.title
     expect(page).to have_content song_four.title
     expect(page).not_to have_content song_one.title
    end
  end
end
