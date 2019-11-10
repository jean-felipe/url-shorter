module WebSites
  class Save
    attr_reader :web_site, :errors

    def initialize(params)
      @url = params[:url]
    end

    def process
      load_web_site
      
      if @web_site.nil?
        if load_title
          if creator
            @web_site
          else
            @errors = [:create, creator.errors]
          end
        else
          false
        end
      else
        if updater
          @web_site
        else
          @errors = [:update, @updater.errors]
        end
      end
    end

    private

    def load_web_site
      @web_site = WebSite.find_by(url: @url)
    end

    def load_title
      read = ReadWebSite.new(@url)
      if read.process
        @title = read.title
        true
      else
        @errors = [:url, 'error loading web site title']
        false
      end
    end

    def creator
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

    def updater
      @web_site = WebSite.find(@web_site.id)
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
