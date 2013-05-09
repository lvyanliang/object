class Runlist < ActiveRecord::Base
  attr_accessible :taskid, :testcaseid, :testcase, :task
  belongs_to :testcase
  belongs_to :task
end
