require 'rails_helper'

describe Artist do

  it "has a working factory." do
    artist = create(:artist)
    artist.valid?
    expect(artist.errors).to be_empty
  end

  describe "#validations" do
    it "must have a name filled in" do
      artist = create(:artist, name: "No Name")
      artist.name = ""
      artist.valid?
      expect(artist.errors).to have_key(:name)
    end

    it "can't have a name, longer than 35 characters" do
      artist = create(:artist, name: "." * 35)
      artist.valid?
      expect(artist.errors).not_to have_key(:name)
      artist.name = "." * 36
      artist.valid?
      expect(artist.errors).to have_key(:name)
    end

    it "must have a unique name" do
      artist3 = Artist.create(name: "Jan")
      artist4 = Artist.create(name: "Jan")
      artist3.valid?
      artist4.valid?
      expect(artist3.errors).not_to have_key(:name)
      expect(artist4.errors).to have_key(:name)
    end

    it "can have no bio" do
      artist = create(:artist, bio: "")
      artist.valid?
      expect(artist.errors).not_to have_key(:bio)
    end

    it "can have a bio, up to 1000 characters" do
      artist2 = create(:artist, bio: "." * 1000)
      artist2.valid?
      expect(artist2.errors).not_to have_key(:bio)
      artist2.bio = "." * 1001
      artist2.valid?
      expect(artist2.errors).to have_key(:bio)
    end
  end

  describe "#associations" do
    let!(:artist1) {create :artist, songs: []}
    let!(:artist2) {create :artist, id: 2, name: "Jan Smit",
                    songs: [song3, song4]}

    let!(:song2) {create :song, id: 16, artist: artist1}
    let!(:song3) {Song.new(id: 17, title: "Laura", year: 1998)}
    let!(:song4) {Song.new(id: 18, title: "Nogwat", year: 1995)}

    it "can have 0 songs" do
      artist1.valid?
      expect(artist1.errors).not_to have_key(:songs)
    end

    it "can have multiple songs" do
      artist2.songs << Song.new(title: "Mama", year: 1983)
      artist2.valid?
      expect(artist2.songs.length).to eq(3)
    end

    it "can access own songs" do
      expect(artist2.songs).to include(song3)
    end

    it "can add songs" do
      expect(artist1.songs.length).to eq(0)
      artist1.songs << Song.new(title: "bla", year: 1925)
      expect(artist1.songs.length).to eq(1)
    end

    it "deletes all songs associated, when deleted" do
      expect(artist2.songs.length).to eq(2)
      expect{artist2.destroy}.to change{Song.count}.by(-2)
      expect(Song.all).not_to include(song3)
      expect(Song.all).not_to include(song4)
    end

    it "cannot access other artists songs" do
      expect(artist2.songs).not_to include(song2)
      expect(artist2.songs).to include(song3)
    end

    it "can have 0 photos" do
      artist = create(:artist, id: 123, name: "No Photos", photos: [])
      artist.valid?
      expect(artist.errors).not_to have_key(:photos)
    end
  end
end
