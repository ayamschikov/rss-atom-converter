class RssConverter
  @@default_fields = {
    description: 'default_description',
    link: 'default_link',
    version: '2.0'
  }

  def self.to_rss(hash)
      @result = RSS::Maker.make(@@default_fields[:version]) do |maker|
        #  Required
        maker.channel.title = hash[:title]
        maker.channel.link = @@default_fields[:link]
        maker.channel.description = @@default_fields[:description]

        hash[:items].each do |entry|
          maker.items.new_item do |item|
            item.link = entry[:link]
            item.title = entry[:title]
            item.pubDate = entry[:published]
          end
        end
      end
  end
end
