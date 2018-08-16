class Converter
  def initialize(hash, options)
    @data = hash
    @options = options
    self.sort
    self.reverse
    return @data
  end

  def reverse
    if @options['reverse']
      @data.items.reverse!
    end
  end

  def sort
    if @options['sort']
      @data.items.sort! {|a, b| a.pubDate <=> b.pubDate}
    end
  end
end
