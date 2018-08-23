module Readers
  require 'open-uri'

  module UrlReader
    def self.can_work?(source)
      source =~ /http/
    end

    def self.read(url)
      open(url)
    end
  end
end
