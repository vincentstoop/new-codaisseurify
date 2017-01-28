require 'rails_helper'

describe Song do

  it "has a working factory." do
    song = build(:song)
    song.valid?
    expect(song.errors).to be_empty
  end
end
