require 'rss'

class Parser
  def initialize(options = {})
    @output_format = options[:output_format]
  end
  
  def to_hash(data)
    xml = RSS::Parser.parse(data)
    xml.feed_type == 'rss' ? RssParser.to_hash(xml) : AtomParser.to_hash(xml)
  end

  # TODO: add method to make rss/atom from hash
  def to_xml(hash)
    if @output_format == 'rss'
      @result = RSS::Maker.make("2.0") do |maker|
        #  Required
        #  Check for existing these fields
        maker.channel.title = hash.title.content
        maker.channel.link = hash.link
        # doesn't work, fix this
        # maker.channel.description = hash.any?(&:subtitle?) ? '' : hash.subtitle
        maker.channel.description = 'test description'

        # Optional
        #  maker.channel.author = hash.author.name.content
        #  maker.channel.updated = hash.updated.content
        #  maker.channel.id = hash.id.content

        hash.entries.each do |entry|
          maker.items.new_item do |item|
            item.link = entry.link
            item.title = entry.title.content
            item.updated = entry.updated.content
            item.pubDate = entry.published.content
          end
        end
      end
    else
      @result = RSS::Maker.make("atom") do |maker|
        # Required
        maker.channel.updated = Time.now
        # hash.title doesn't work
        maker.channel.title = 'test title' #hash.title
        # hash.id doesn't work
        maker.channel.id = 'test id' #hash.id

        maker.channel.author = 'author'


        hash.items.each do |item|
          maker.items.new_item do |entry|
            entry.link = item.link
            entry.title = item.title
            entry.published = item.pubDate
            entry.updated = item.pubDate
          end
        end
      end
    end
    @result
  end
end
