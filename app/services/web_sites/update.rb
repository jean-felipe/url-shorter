module WebSites
  class Update
    attr_reader :web_site, :errors

    def initialize(id)
      @id = id
    end

    def process
      @web_site = WebSite.find(@id)
      counter = @web_site.counter
      @web_site.counter = counter + 1

      if @web_site.valid?
        @web_site.save
      else
        @errors = @web_site.errors
      end
    end
  end
end
