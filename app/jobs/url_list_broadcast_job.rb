class UrlListBroadcastJob < ApplicationJob
  queue_as :default

  def perform
    web_sites = WebSites::Read.new(nil, nil, nil).process
    ActionCable.server.broadcast 'url_list_channel', data: web_sites.as_json
  end
end
