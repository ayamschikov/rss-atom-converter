class AtomConverter
  @@default_fields = {
    id: 'id',
    author: 'default_author'
  }
  def self.to_atom(hash)
      @result = RSS::Maker.make("atom") do |maker|
        # Required
        maker.channel.updated = Time.now
        # hash.title doesn't work
        maker.channel.title = 'test title' #hash.title
        # hash.id doesn't work
        maker.channel.id = 'test id' #hash.id

        maker.channel.author = @@default_fields[:author]


        hash[:items].each do |item|
          maker.items.new_item do |entry|
            entry.link = item[:link]
            entry.title = item[:title]
            entry.published = item[:pubDate]
            entry.updated = item[:pubDate]
          end
        end
      end
  end
end
