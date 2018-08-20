class Reader
  attr_reader :data

  def read(file)
    @data = file =~ /http/ ? Url.read(file) : FileReader.read(file)
  end
end
