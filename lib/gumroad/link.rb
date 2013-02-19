module Gumroad
  class Link
    attr_accessor :id, :name, :url, :description, :price, :variants, :require_shipping
    
    def initialize(session, json)
      @session = session
      json.symbolize_keys! rescue true
      [:id, :name, :url, :description, :price, :variants, :require_shipping].each do |attribute|
        instance_variable_set(:"@#{attribute}", json[attribute])
      end
    end

    def save
      params = {
          name: name, 
          url: url, 
          description: description, 
          price: price, 
          variants: variants, 
          require_shipping: require_shipping
        }
      json = @session.post("/links", params)
      self.id = json["link"]["id"]
      self
    end

    def update
      params = {
          name: name, 
          url: url, 
          description: description, 
          price: price, 
          variants: variants, 
          require_shipping: require_shipping
        }
      @session.put("/links/#{id}", params)
      self
    end

    def destroy
      @session.delete("/links/#{id}")
    end
  end
end
