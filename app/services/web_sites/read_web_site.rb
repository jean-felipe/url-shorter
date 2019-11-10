module WebSites
  class ReadWebSite
    attr_reader :title, :errors

    def initialize(url)
      @url = url
    end

    def process
      if @url.nil?
        @errors = [:url, 'cannot be nil']
      else
        @title = Nokogiri::HTML::Document.parse(HTTParty.get(@url).body).title
        true
      end
    end
  end
end
