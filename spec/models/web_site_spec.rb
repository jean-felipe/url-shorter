require 'spec_helper'

RSpec.describe WebSite do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:url) }
    it { should validate_uniqueness_of(:url) }
  end
end
