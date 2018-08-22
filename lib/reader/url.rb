module Readers
  require 'open-uri'

  class UrlReader
    def self.can_work?(source)
      source =~ /http/
    end

    def self.read(url)
      open(url)
    end
  end
end
