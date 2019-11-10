class WebSitesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  before_action :load_web_site, only: [:show, :create]
  
  def index
    render json: reader.process, status: 200
  end

  def create
    web_site = saver.process
    if web_site
      render json: web_site, status: 200
    else
      render json: saver.errors, status: 422
    end
  end

  def show
    @props = {
      component_name: 'open_web_site',
      component_data: [@web_site.as_json]
    }
  end

  private

  def reader
    WebSites::Read.new(params[:filter], params[:order], params[:page])
  end

  def saver
    WebSites::Save.new(web_site_params)
  end

  def web_site_params
    params.require(:web_site).permit(:url)
  end

  def load_web_site
    if params[:url]
      @web_site = WebSite.find_by(shorted_url: params[:url])
    else
      @web_site = WebSite.find_by(shorted_url: web_site_params[:url])
    end
  end
end
