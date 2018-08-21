class AtomConverter
  @@default_fields = {
    id: 'id',
    author: 'default_author'
  }
  def self.to_xml(hash)
      @result = RSS::Maker.make("atom") do |maker|
        # Required
        maker.channel.updated = Time.now
        maker.channel.title = hash[:title]
        maker.channel.id = @@default_fields[:id]
        maker.channel.author = @@default_fields[:author]

        hash[:items].each do |item|
          maker.items.new_item do |entry|
            entry.link = item[:link]
            entry.title = item[:title]
            entry.updated = item[:published]
          end
        end
      end
  end
end
