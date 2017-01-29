require 'rails_helper'

describe Song do

  it "has a working factory." do
    song = build(:song)
    song.valid?
    expect(song.errors).to be_empty
  end

  describe "#validations" do
    it "can not exist without a title" do
      song = build(:song, title: "")
      song.valid?
      expect(song.errors).to have_key(:title)
    end

    it "can have a title, up to 40 characters long" do
      song1 = build(:song, title: "." * 40)
      song2 = build(:song, title: "." * 41)
      song1.valid?
      song2.valid?
      expect(song1.errors).not_to have_key(:title)
      expect(song2.errors).to have_key(:title)
    end

    it "does not exist without a year of release" do
      song1 = build(:song, year: "")
      song1.valid?
      expect(song1.errors).to have_key(:year)
    end

    it "does not allow the year to be before 1900" do
      song1 = build(:song, year: 1899)
      song1.valid?
      expect(song1.errors).to have_key(:year)
    end

    it "does not allow the year to be later than when entered" do
      song1 = build(:song, year: Date.today.year + 1)
      song1.valid?
      expect(song1.errors).to have_key(:year)
    end

    it "does not allow for the year to be a string" do
      song1 = build(:song, year: "bla")
      song1.valid?
      expect(song1.errors).to have_key(:year)
    end
  end




  describe "#Associations" do
    it "cannot exit without an artist" do
      song1 = Song.create(title: 'No artist', year: 1992)
      song1.valid?
      expect(song1.errors).to have_key(:artist)
    end
  end
end
