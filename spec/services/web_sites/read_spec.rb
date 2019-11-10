require 'rails_helper'

RSpec.describe WebSites::Read do
  describe '#process' do
    subject { described_class.new(filter, order, page) }

    let(:filter) { nil }
    let(:order) { nil }
    let(:page) { nil }

    before do
      create(:web_site, counter: 2)
      create(:web_site, counter: 3)
      create(:web_site, counter: 2)
      create(:web_site, counter: 1, title: 'Less frequently')
      create(:web_site, counter: 10, title: 'Most frequently')
    end

    context 'when listing all the web sites' do   
      it 'returns a list with web sites ordered by cunter' do
        subject.process
        expect(subject.web_sites.count).to eq(5)
        expect(subject.web_sites.first.title).to eq('Most frequently')
        expect(subject.web_sites.last.title).to eq('Less frequently')
      end
    end

    context 'when sorting asc' do
      let(:order) { 'asc' }

      it 'returns a list of web sites' do
        subject.process
        expect(subject.web_sites.count).to eq(5)
        expect(subject.web_sites.last.title).to eq('Most frequently')
        expect(subject.web_sites.first.title).to eq('Less frequently')
      end
    end

    context 'when page is sent' do
      let(:page) { 2 }

      it 'returns a empty list' do
        subject.process
        expect(subject.web_sites.size).to eq(0)
      end
    end
  end
end
