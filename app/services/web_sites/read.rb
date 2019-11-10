module WebSites
  class Read
    attr_reader :web_sites

    def initialize(filter, order, page)
      @filter = filter
      @order = order || 'desc'
      @page = page || 1
    end

    def process
      @web_sites = WebSite.all.order(counter: :"#{@order}").page(@page)
    end
  end
end
