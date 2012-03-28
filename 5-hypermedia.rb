Bundler.setup
require 'roar/representer/json'
require 'roar/representer/json/hal'
require 'roar/representer/feature/hypermedia'

Fruit      = Struct.new(:title, :colors)
Bowl   = Struct.new(:fruits, :location)

pear  = Fruit.new("Beck's", 4.9)
ganter = Fruit.new("Ganter", 5.1)

module FruitRepresenter
  include Roar::Representer::JSON::HAL
 
  property :title
  collection :colors
  
  link :self do
    "http://fruits/#{title.downcase}"
  end
end

module BowlRepresenter
  include Roar::Representer::JSON::HAL
 
  property :location
  collection :fruits, :as => Fruit, :extend => FruitRepresenter, :embedded => true
  
  link :self do
    "http://bowls/#{location}"
  end
  
  link :fruits do
    "http://bowls/#{location}/fruits"
  end
  
end

bowl = Bowl.new([Fruit.new("Apple")], "desk").extend(BowlRepresenter)
puts bowl.to_json
