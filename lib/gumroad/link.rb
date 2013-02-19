module Gumroad
  class Link
    attr_accessor :id, :name, :url, :description, :price, :variants, :preview, :require_shipping
    
    def initialize(session, json)
      @session = session
      [:id, :name, :url, :description, :price, :variants, :preview, :require_shipping].each do |attribute|
        instance_variable_set(:"@#{attribute}", json[attribute.to_s])
      end
    end

    def save
      params = {
          name: name, 
          url: url, 
          description: description, 
          price: price, 
          variants: variants, 
          preview: preview,
          require_shipping: require_shipping
        }
      @session.post("/links", params)
      self
    end

    def update
      params = {
          name: name, 
          url: url, 
          description: description, 
          price: price, 
          variants: variants, 
          preview: preview,
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
