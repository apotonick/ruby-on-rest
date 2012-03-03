module BowlRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia
  
  property :location
  collection :fruits, :class => Fruit, :extend => FruitRepresenter
  
  link :self do
    "http://bowls/#{id}"
  end
end
