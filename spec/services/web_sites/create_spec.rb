require 'rails_helper'

RSpec.describe WebSites::Create do
  describe '#process' do
    subject { described_class.new(url, title) }
    
    context 'when a new url is sent' do
      let(:url) { 'https://www.youtube.com/watch?v=1EGfjW4adk4' }
      let(:title) { 'EPISÓDIO COMPLETO' }
      
      it 'creates a new web site and a new shortened url' do
        expect { subject.process }.to change{ WebSite.count }.from(0).to(1)
        expect(subject.web_site.title).to eq('EPISÓDIO COMPLETO')
        expect(subject.web_site.url).to eq('https://www.youtube.com/watch?v=1EGfjW4adk4')
      end
    end

    context 'when title is nil' do
      let(:title) { nil }
      let(:url) { 'https://www.youtube.com/watch?v=1EGfjW4adk4' }

      it 'adds a error message' do
        subject.process
        expect(subject.errors.first).to eq([:title, "can't be blank"])
      end
    end
  end
end
