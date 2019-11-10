require 'rails_helper'

RSpec.describe WebSites::Update do
  describe '#process' do
    let(:web_site) { create(:web_site, counter: 1) }
   
    subject { described_class.new(id) }

    context 'when a url is accessed again' do
      let(:id) { web_site.id }

      it 'updates the counter for the given web site' do
        subject.process
        expect(subject.web_site.counter).to eq(2)
      end
    end

    context 'when the id sent is invalid' do
      let(:id) { 'foo' }

      it 'raises an not found error' do
        expect { subject.process }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
