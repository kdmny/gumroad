module Gumroad
  class LinkProxy
    def initialize(session)
      @session = session
    end

    def find(id)
      link_obj = @session.get("/links/#{id}")['link']
      if link_obj.nil?
        return nil
      else
        Gumroad::Link.new(@session, @session.get("/links/#{id}")['link'])
      end
    end

    def all
      @session.get('/links')['links'].map do |json|
        Gumroad::Link.new(@session, json)
      end
    end
    
    def create(params={})
      json = @session.post("/links", params)
      Gumroad::Link.new(@session, json['link'])
    end
  end
end
