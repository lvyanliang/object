class Teststep < ActiveRecord::Base
  attr_accessible :callMethod, :expectValue, :inputValue, :objName, :runFlag, :step, :stepDesc, :stepMethod, :testcaseName, :testcase
end
