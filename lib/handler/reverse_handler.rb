class ReverseHandler
  def initialize(options = {})
    @options = options
  end

  def process(source)
    source.reverse
  end
end
