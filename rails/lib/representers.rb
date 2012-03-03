module PaigeRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia
  
  property :total
  collection :items, :class => Fruit, :extend => FruitRepresenter
  
  link :self do
    "http://bowls/1"
  end
  
  link :next do
    "http://bowls/1?page=#{page}"
  end
  
end
