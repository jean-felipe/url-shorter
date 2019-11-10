FactoryBot.define do
  factory :web_site do
    title { Faker::Superhero.name }
    url { Faker::Internet.url }
    shorted_url { SecureRandom.hex(2) }
    counter { Faker::Number.between(from: 1, to: 10) }
  end
end
