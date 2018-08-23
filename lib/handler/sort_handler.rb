class SortHandler
  def initialize(options = {})
    @options = options
  end

  def process(source)
    @options.each { |sort_type| source.sort! {|a, b| a[sort_type] <=> b[sort_type]} }
    source
  end
end
