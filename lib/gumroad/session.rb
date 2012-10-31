require 'httparty'

module Gumroad
  class Session
    include HTTParty
    base_uri 'https://gumroad.com/api/v1'
    attr_accessor :token

    def initialize(args)
      @token = args[:token]
      if @token.nil? 
        @token = post('/sessions', {
          email: args[:email], password: args[:password]
        })['token']
      end
      self.class.basic_auth @token, ''
    end

    def destroy
      delete('/sessions')
    end

    def post(path, params)
      self.class.post(path, body: params)
    end

    def put(path, params)
      self.class.put(path, body: params)
    end

    def get(path)
      self.class.get(path)
    end

    def delete(path)
      self.class.delete(path)
    end

    def links
      Gumroad::LinkProxy.new(self)
    end
  end
end
