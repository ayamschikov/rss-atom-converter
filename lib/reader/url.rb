require 'open-uri'

class Url
  def self.read(url)
    open(url)
  end
end
