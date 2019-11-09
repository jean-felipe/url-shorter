FactoryBot.define do
  factory :web_site do
    title { Faker::Superhero.name }
    url { Faker::Internet.url }
    counter { 1 }
  end
end
