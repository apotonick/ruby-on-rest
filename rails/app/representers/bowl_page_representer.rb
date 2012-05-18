module BowlPageRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia
  
  property :total_entries
  collection :items, :extend => FruitRepresenter
  
  link :self do |opts|
    bowl_url(opts[:bowl], :page => current_page)
  end
  
  link :next do |opts|
    bowl_url(opts[:bowl], :page => next_page) if next_page
  end
  
  link :previous do |opts|
    bowl_url(opts[:bowl], :page => previous_page) if previous_page
  end
  
  def items
    self
  end
  
end
