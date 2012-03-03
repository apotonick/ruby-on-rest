class Bowl < ActiveRecord::Base
  has_and_belongs_to_many :fruits
end
