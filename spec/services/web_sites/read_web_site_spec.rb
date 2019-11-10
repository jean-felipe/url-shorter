require 'rails_helper'

RSpec.describe WebSites::ReadWebSite do
  describe '#process' do
    subject { described_class.new(url) }

    let(:url) { 'https://www.youtube.com/' }

    before do
      subject.process
    end

    context 'when a valid url is sent' do      
      it 'calls HTTParty get method' do
        expect(subject.title).to eq('YouTube')
      end
    end

    context 'when url is nil' do
      let(:url) { nil }

      it 'adds a error message' do
        expect(subject.errors).to eq([:url, 'cannot be nil'])
      end
    end
  end
end
