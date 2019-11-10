class WebSitesController < ApplicationController
  before_action :load_web_site, only: [:show, :create]
  
  def index
    render json: reader.process, status: 200
  end

  def create
    if saver.process
      render json: saver.web_site, status: 200
    else
      render json: saver.errors, status: 422
    end
  end

  def show
    render json: @web_site, status: 200
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
