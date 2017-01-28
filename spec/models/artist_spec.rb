require 'rails_helper'

describe Artist do

  it "has a working factory." do
    artist = build(:artist)
    artist.valid?
    expect(artist.errors).to be_empty
  end
end
