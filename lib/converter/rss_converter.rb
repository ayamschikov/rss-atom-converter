module Converter
  class RssConverter
    DEFAULT_FIELDS = {
      description: 'default_description',
      link: 'default_link',
      version: '2.0'
    }.freeze

    def self.can_convert?(output_format)
      output_format == 'rss'
    end

    def convert(hash)
      result = RSS::Maker.make(DEFAULT_FIELDS[:version]) do |maker|
        #  Required
        maker.channel.title = hash[:title]
        maker.channel.link = DEFAULT_FIELDS[:link]
        maker.channel.description = DEFAULT_FIELDS[:description]

        hash[:items].each do |entry|
          maker.items.new_item do |item|
            item.link = entry[:link]
            item.title = entry[:title]
            item.pubDate = entry[:published]
          end
        end
      end
      result
    end
  end
end
