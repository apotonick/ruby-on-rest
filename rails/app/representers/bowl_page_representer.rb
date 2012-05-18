module PaginationRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia
    
  property :total_entries
  
  link :self do |opts|
    page_url(opts[:model], :page => current_page)
  end
  
  link :next do |opts|
    page_url(opts[:model], :page => next_page) if next_page
  end
  
  link :previous do |opts|
    page_url(opts[:model], :page => previous_page) if previous_page
  end
  
  def items
    self
  end
  
  def page_url(*)
    raise "Implement me."
  end
end


module BowlPageRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia
  include PaginationRepresenter
  
  collection :items, :extend => FruitRepresenter
  
  def page_url(*args)
    bowl_url(*args)
  end
end
