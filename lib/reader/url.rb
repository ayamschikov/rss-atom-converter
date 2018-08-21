require 'open-uri'

class UrlReader
  def self.read(url)
    open(url)
  end
end
