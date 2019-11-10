require 'spec_helper'

RSpec.describe WebSites::ReadWebSite do
  describe '#process' do
    subject(described_class.new(url: url))

    let(:url) { 'https://www.youtube.com/' }
    let(:response) { instance_double(HTTParty::Response, body: response_body) }
    let(:response_body) { 'response_body' }

    before do
      allow(HTTParty).to receive(:get).and_return(response)
      subject.process
    end

    context 'when a valid url is sent' do      
      it 'calls HTTParty get method' do
        expect(HTTParty).to have_received(:get).with(url)
        expect(subject.title).to eq('Youtube')
      end
    end

    context 'when url is nil' do
      let(:url) { nil }

      it 'adds a error message' do
        expect(subject.errors.first).to eq('Url cannot be nil')
      end
    end
  end
end
