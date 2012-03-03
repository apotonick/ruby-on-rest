module PaigeRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia
  
  property :total_entries
  collection :items, :class => Fruit, :extend => FruitRepresenter
  
  link :self do
    "http://bowls/#{current_page}"
  end
  
  link :next do
    "http://bowls/1?page=#{next_page}"
  end
  
  def items
    self
  end
  
end
