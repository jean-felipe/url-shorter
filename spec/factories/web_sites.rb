# == Schema Information
#
# Table name: web_sites
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  url         :string           not null
#  shorted_url :string           not null
#  counter     :integer          default("1")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_web_sites_on_url  (url)
#

FactoryBot.define do
  factory :web_site do
    title { Faker::Superhero.name }
    url { Faker::Internet.url }
    shorted_url { SecureRandom.hex(2) }
    counter { Faker::Number.between(from: 1, to: 10) }
  end
end
