require 'spec_helper'

RSpec.describe WebSites::Update do
  describe '#process' do
    before do
      let(:web_site) { create(:web_site) }
    end

    subject(described_class.new(id: id).process)

    context 'when a url is accessed again' do
      let(:id) { web_site.id }

      it 'updates the counter for the given web site' do
        expect { subject }.to change{ web_site.counter }.from(1).to(2)
      end
    end

    context 'when the id sent is invalid' do
      let(:id) { 'foo' }

      it 'raises an not found error' do
        expect { subject }.to raise_error(NotFoundError)
      end
    end
  end
end
