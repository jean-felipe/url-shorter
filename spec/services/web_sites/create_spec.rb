require 'spec_helper'

RSpec.describe WebSites::Create do
  describe '#process' do
    subject(described_class.new(url: url, title: title).process)
    let(:url) { 'https://www.youtube.com/watch?v=1EGfjW4adk4' }

    context 'when a new url is sent' do
      let(:title) { 'EPISÓDIO COMPLETO' }
      
      it 'creates a new web site and a new shortened url' do
        expect { subject }.to change{ WebSite.count }.from(0).to(1)
        expect(subject.web_site.title).to eq('EPISÓDIO COMPLETO')
        expect(subject.web_site.url).to eq('https://www.youtube.com/watch?v=1EGfjW4adk4')
      end
    end

    context 'when title is nil' do
      let(:title) { nil }

      it 'adds a error message' do
        expect(subject.errors.first).to eq('Title is required')
      end
    end
  end
end
