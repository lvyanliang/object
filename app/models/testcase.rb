class Testcase < ActiveRecord::Base
  attr_accessible :browser, :capture, :description, :name, :runFlag
  has_one :runlist, :dependent=>:destroy  
end
