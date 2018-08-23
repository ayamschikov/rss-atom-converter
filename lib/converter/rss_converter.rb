module Converter
  class RssConverter
    def initialize(default_fields)
      @default_fields = {
        description: 'default_description',
        link: 'default_link',
        version: '2.0'
      }
    end

    def convert(hash)
      @result = RSS::Maker.make(@default_fields[:version]) do |maker|
        #  Required
        maker.channel.title = hash[:title]
        maker.channel.link = @default_fields[:link]
        maker.channel.description = @default_fields[:description]

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
end
