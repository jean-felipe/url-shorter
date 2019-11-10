require 'spec_helper'

RSpec.describe WebSiteController do
  describe '#index' do
    before(:all) do
      create_list(:web_site, 3)
      create(:web_site, title: 'Google', counter: 10)
    end

    context 'when listing the most shortened urls' do
      it 'returns an array with the web sites ordered by counter attribute' do
        get :index
        expect(json.dig('web_sites', 0, 'title')).to eq('Google')
        expect(json.dig('web_sites').count).to eq(4)
      end
    end
  end

  describe '#show' do
    subject { get :show, params }
    
    let(:web_site) { create(:web_site, url: 'https://www.youtube.com/') }

    context 'when the shortened url is accessed' do
      let(:params) do
        {
          url: web_site.shorted_url
        }
      end

      it 'redirects to the website' do
        expect(subject).to redirect_to(web_site.url)
      end
    end
  end

  describe '#create' do
    let(:params) do
      {
        web_site: {
          url: 'https://www.youtube.com/'
        }
      }
    end

    context 'when send a new url to be shortened' do
      it 'creates the new website' do
        post :create, params
        expect(json.dig('web_site', 'title')).to eq('Youtube')
        expect(json.dig('web_site', 'counter')).to eq(1)
        expect(response.status).to eq(201)
      end
    end

    context 'when an already sent url is sent again' do
      before do
        create(:web_site, url: 'https://www.youtube.com/')
      end

      it 'updates the counter to 2' do
        post :create, params
        expect(json.dig('web_site', 'title')).to eq('Youtube')
        expect(json.dig('web_site', 'counter')).to eq(2)
        expect(response.status).to eq(200)
      end
    end
  end
end
