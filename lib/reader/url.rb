require 'open-uri'

class Url
  def read(url)
    open(url)
  end
end
