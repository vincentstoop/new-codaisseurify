FactoryGirl.define do
  factory :artist do
    id { 1 }
    name { "Marco Borsato" }
    bio { "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur." }
    songs {[Song.new(title: "De Bestemming", year: 1990)]}
    photos {[Photo.new(remote_picture_url: "http://res.cloudinary.com/vincentstoop/image/upload/c_fit,h_450,q_80,w_600/v1485626015/yp21sobsdkuqlc47npg6.jpg")]}
  end
end
