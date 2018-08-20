class Converter
  def initialize(options)
    @options = options
  end

  def convert(data)
    @data = data
    if @options['sort']
      self.sort
    end
    if @options['reverse']
      self.reverse
    end
    @data
  end

  # TODO: change reverse and sort methods according to hash structure
  def reverse
      @data.items.to_a.each {|item| puts item.css('title content') }
  end

  def sort
      @data.items.sort! {|a, b| a.pubDate <=> b.pubDate}
  end
end
