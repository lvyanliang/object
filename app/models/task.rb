class Task < ActiveRecord::Base
  attr_accessible :name, :runmachine, :runtime, :counter
  has_many :runlists, :dependent=>:nullify
end
