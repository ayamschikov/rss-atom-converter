class RssParser
  def self.to_hash(source)
    hash = {
      title: source.channel.title,
      description: source.channel.description,
      link: source.channel.link,
      items: []
    }

    source.channel.items.each do |item|
      hash[:items].push(
        title: item.title,
        published: item.pubDate,
        description: item.description,
        link: item.link
      )
    end
    hash
  end
end
