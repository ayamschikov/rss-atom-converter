class HandlerHelper
  def initialize(options = {})
    @options = options
  end

  def process(data)
    @data = data
    @options.each do |option_name, option_value|
      handler = Object.const_get("#{option_name.capitalize}Handler").new(option_value)
      @data[:items] = handler.process(@data[:items])
    end
    @data
  end
end
