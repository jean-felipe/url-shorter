require 'spec_helper'

RSpec.describe WebSites::Read do
  describe '#process' do
    subject(described_class.new(filter: filter, order: order, page: page).process)

    let(:filter) { nil }
    let(:order) { nil }
    let(:page) { nil }

    before(:all) do
      create(:web_sites, counter: 2)
      create(:web_sites, counter: 3)
      create(:web_sites, counter: 2)
      create(:web_sites, counter: 1, title: 'Less frequently')
      create(:web_sites, counter: 10, title: 'Most frequently')
    end

    context 'when listing all the web sites' do    
      it 'returns a list with web sites ordered by cunter' do
        expect(subject.web_sites).count eq(5)
        expect(subject.web_sites.first.title).tp eq('Most frequently')
        expect(subject.web_sites.last.title).tp eq('Less frequently')
      end
    end

    context 'when sorting descending' do
      let(:order) { 'desc' }

      it 'returns a list of web sites' do
        expect(subject.web_sites).count eq(5)
        expect(subject.web_sites.last.title).tp eq('Most frequently')
        expect(subject.web_sites.first.title).tp eq('Less frequently')
      end
    end

    context 'when page is sent' do
      let(:page) { 2 }

      it 'returns a empty list' do
        expect(subject.web_sites).count eq(0)
      end
    end
  end
end
