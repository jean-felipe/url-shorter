class HomeController < ApplicationController
  def index
    @props = {
      component_name: 'url_input',
      component_data: [],
    }
  end
end
