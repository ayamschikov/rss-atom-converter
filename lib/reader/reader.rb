class Reader
  attr_reader :data
  def initialize(file)
    @file = file
    @data = @file =~ /http/ ? Url.read(@file) : FileReader.read(@file)
  end
end
