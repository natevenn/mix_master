require 'rails_helper'

RSpec.feature "User views all playlist" do
  scenario "User can see the page with all playlists" do
    playlist1 = create(:playlist)
    playlist2 = create(:playlist)

    visit playlists_path

    expect(page).to have_content playlist1.name
    expect(page).to have_content playlist2.name

    click_link playlist1.name
    expect(page).to have_current_path(playlist_path(playlist1))
  end
end
