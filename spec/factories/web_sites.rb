FactoryBot.define do
  factory :web_site do
    title { Faker::Superhero.name }
    url { Faker::Internet.url }
    shorted_url { SecureRandom.hex(2) }
    counter { 1 }
  end
end
