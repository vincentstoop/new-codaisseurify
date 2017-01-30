require 'rails_helper'

feature 'Manage songs', js: true do
  let!(:artist1) {create :artist, name: 'John Doe',
                  songs: [Song.new(title: "De Bestemming", year: 1992),
                         Song.new(title: "Laura", year: 2005)]}

  scenario 'add a new song' do
    visit artist_path artist1.id

    fill_in 'input_title', with: 'Just a song'
    fill_in 'input_year', with: '1993'

    page.execute_script("$('form').submit()")

    expect(page).to have_content('Just a song')
  end

  scenario 'deletes a song' do
    visit artist_path artist1.id

    within '#songList' do
      row = find('tr[data-song="1"]')
      within row do
        find('span.destroy').click
      end
      expect('#songList').not_to include("De Bestemming")
    end
  end

  scenario 'deletes all songs' do
    visit artist_path artist1.id
    find('span#delete_all_songs').click
    expect('#songList').not_to include("De Bestemming")
    expect('#songList').not_to include("Laura")
  end
end
