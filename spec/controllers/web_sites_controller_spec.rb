require 'rails_helper'

RSpec.describe WebSitesController do
  describe '#index' do
    before(:all) do
      create_list(:web_site, 3)
      create(:web_site, title: 'Google', counter: 25)
    end

    context 'when listing the most shortened urls' do
      it 'returns an array with the web sites ordered by counter attribute' do
        get :index
        expect(json.first.dig('title')).to eq('Google')
        expect(json.count).to eq(4)
      end
    end
  end

  describe '#show' do
    let(:web_site) { create(:web_site, url: 'https://www.youtube.com/') }

    context 'when the shortened url is accessed' do
      let(:params) do
        {
          url: web_site.shorted_url
        }
      end

      it 'redirects to the website' do
        get :show, params: params
        expect(response.status).to eq(200)
        expect(json)
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
        post :create, params: params
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
        post :create, params: params
        expect(json.dig('web_site', 'title')).to eq('Youtube')
        expect(json.dig('web_site', 'counter')).to eq(2)
        expect(response.status).to eq(200)
      end
    end
  end
end
