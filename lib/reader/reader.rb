class Reader
  attr_reader :data

  def read(source)
    @data = source =~ /http/ ? Url.read(source) : FileReader.read(source)
  end
end
