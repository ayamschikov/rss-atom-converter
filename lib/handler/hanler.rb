class HandlerHelper
  def initialize(options = {sort: ['title', 'published'], reverse: true})
    @options = options
  end

  def process(data)
    @data = data
    @options.each do |option|
      # TODO: fix option drop
      handler = Object.const_get("#{option.first.capitalize}Handler").new(option.drop(1))
      @data[:items] = handler.process(@data[:items])
    end
    @data
  end
end
