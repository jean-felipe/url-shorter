module WebSites
  class Create
    attr_reader :errors, :web_site

    def initialize(url, title)
      @url = url
      @title = title
    end

    def process
      @web_site = WebSite.new(
        title: @title,
        url: @url,
        shorted_url: SecureRandom.hex(2)
      )
      
      if @web_site.valid?
        @web_site.save
      else
        @errors = @web_site.errors
        false
      end
    end
  end
end
