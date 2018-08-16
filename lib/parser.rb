require 'rss'

class Parser
  def initialize(data)

  end
  
  # TODO: add atom support
  def reverse
    if @options['reverse']
      @rss.channel.items.reverse!
    end
  end

  def sort
    if @options['sort']
      @rss.channel.items.sort! {|a, b| a.pubDate <=> b.pubDate}
    end
  end
end
