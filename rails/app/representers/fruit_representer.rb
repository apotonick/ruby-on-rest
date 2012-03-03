module FruitRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia
  
  property :title
  
  link :self do
    fruit_url(title)
  end
end
