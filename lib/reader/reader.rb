class Reader
  def initialize(file)
    @file = file
    @data =~ /http/ ? Url.read(@file) : File.read(@file)
  end
end
