module Converter
  class AtomConverter
    DEFAULT_FIELDS = {
      id: 'id',
      author: 'default_author'
    }

    def self.can_convert?(output_format)
      output_format == 'atom'
    end

    def convert(hash)
      result = RSS::Maker.make('atom') do |maker|
        # Required
        maker.channel.updated = Time.now
        maker.channel.title = hash[:title]
        maker.channel.id = DEFAULT_FIELDS[:id]
        maker.channel.author = DEFAULT_FIELDS[:author]

        hash[:items].each do |item|
          maker.items.new_item do |entry|
            entry.link = item[:link]
            entry.title = item[:title]
            entry.updated = item[:published]
          end
        end
      end
      result
    end
  end
end
