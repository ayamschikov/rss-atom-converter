module Converter
  class AtomConverter
    def initialize(default_fields = {})
      @default_fields = {
        id: 'id',
        author: 'default_author'
      }.merge(default_fields)
    end

    def self.can_convert?(output_format)
      "#{output_format.capitalize}Converter" == 'AtomConverter' 
    end

    def convert(hash)
      result = RSS::Maker.make("atom") do |maker|
        # Required
        maker.channel.updated = Time.now
        maker.channel.title = hash[:title]
        maker.channel.id = @default_fields[:id]
        maker.channel.author = @default_fields[:author]

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
