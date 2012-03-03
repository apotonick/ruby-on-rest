class FruitsController < ApplicationController
  respond_to :json

  def show
    fruit = Fruit.find_by_id(params[:id])
    
    respond_with fruit
  end
  
  def create
    fruit = Fruit.new.extend(FruitRepresenter).from_json(request.body.string)
    
    respond_with fruit
  end
  

  def self.responder
    Class.new(super).send :include, Roar::Rails::Responder
  end
end
