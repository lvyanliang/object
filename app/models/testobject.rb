class Testobject < ActiveRecord::Base
  
  attr_accessible :id,:comment, :eltype, :how, :name, :locate, :property
  
  validates_presence_of :name, :comment, :property
  
  validates_uniqueness_of :name
  
end
