class RssConverter
  @@default_fields = {
    description: 'default_description'
  }

  def self.to_rss(hash)

      @result = RSS::Maker.make("2.0") do |maker|
        #  Required
        #  Check for existing these fields
        maker.channel.title = hash[:title]
        maker.channel.link = hash[:link]
        # doesn't work, fix this
        # maker.channel.description = hash.any?(&:subtitle?) ? '' : hash.subtitle
        maker.channel.description = @@default_fields[:description]

        # Optional
        #  maker.channel.author = hash.author.name.content
        #  maker.channel.updated = hash.updated.content
        #  maker.channel.id = hash.id.content

        hash[:items].each do |entry|
          maker.items.new_item do |item|
            item.link = entry[:link]
            item.title = entry[:title]
            item.updated = entry[:updated]
            item.pubDate = entry[:published]
          end
        end
      end

  end
end
