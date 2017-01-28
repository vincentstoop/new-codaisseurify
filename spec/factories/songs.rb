FactoryGirl.define do
  factory :song do
    title { "Ik zing dit lied" }
    year { 1995 }
    artist { build(:artist) }
  end
end
