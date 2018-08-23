class SortHandler
  def initialize(options = {})
    @options = options
  end

  def process(source)
    @options.each { |sort_type| source.sort! { |a, b| a[sort_type.to_sym] <=> b[sort_type.to_sym] } }
    source
  end
end
