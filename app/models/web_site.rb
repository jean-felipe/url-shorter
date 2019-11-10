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

class WebSite < ApplicationRecord
  validates :url, :title, :shorted_url, presence: true
  validates :url, uniqueness: true

end
