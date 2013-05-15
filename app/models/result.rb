class Result < ActiveRecord::Base
  attr_accessible :actualvalue, :counter, :result, :runtime, :testCaseName, :teststep_id
end
