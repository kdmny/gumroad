require 'gumroad/version'
require 'gumroad/session'
require 'gumroad/link'
require 'gumroad/link_proxy'

module Gumroad
  class << self
    def new(args)
        Gumroad::Session.new(args)
    end
  end
end
