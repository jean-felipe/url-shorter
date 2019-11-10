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

require 'rails_helper'

RSpec.describe WebSite do
  describe 'validations' do
    subject { create(:web_site) }
    
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:url) }
    it { should validate_uniqueness_of(:url) }
  end
end
