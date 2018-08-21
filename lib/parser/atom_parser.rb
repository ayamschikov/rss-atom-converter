class AtomParser
  def self.to_hash(source)
    hash = {
      title: source.title.content,
      id: source.id.content,
      updated: source.updated.content,
      items: []
    }

    source.entries.each do |entry|
      hash[:items].push(
        title: entry.title.content,
        updated: entry.updated.content,
        published: entry.published.content,
        id: entry.id.content
      )
    end
    hash
  end
end
