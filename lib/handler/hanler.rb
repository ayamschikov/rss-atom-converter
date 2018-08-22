class Handler
  def initialize(options)
    @sort = options[:sort]
    @reverse = options[:reverse]
  end

  def process(data)
    @data = data
    if @sort
      sort
    end
    if @reverse
      reverse
    end
    @data
  end

  def reverse
    @data[:items].reverse!
  end

  def sort
    @data[:items].sort! {|a, b| a[:published] <=> b[:published]}
  end
end
