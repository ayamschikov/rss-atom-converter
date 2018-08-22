module Parser
  module RssParser
    def self.parse(source)
      rss_hash = {
        title: source.channel.title,
        description: source.channel.description,
        link: source.channel.link,
        items: []
      }

      source.channel.items.each do |item|
        rss_hash[:items].push(
          title: item.title,
          published: item.pubDate,
          description: item.description,
          link: item.link
        )
      end
      rss_hash
    end
  end
end
