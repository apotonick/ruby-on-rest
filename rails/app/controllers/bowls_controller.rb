class BowlsController < ApplicationController
  include Roar::Rails::ControllerAdditions
  respond_to :json

  def show
    respond_with Bowl.find_by_id(params[:id])
  end
  
  def create
    bowl = Bowl.new.extend(BowlRepresenter).from_json(request.body.string)
    #puts bowl.fruits.inspect
    bowl.fruits = bowl.fruits.collect do |f|
      Fruit.find_by_title(f.title)
    end
    
    bowl.save
    
    respond_with bowl
  end
end
