class UrlListChannel < ApplicationCable::Channel
  def subscribed
    stream_from "url_list_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
