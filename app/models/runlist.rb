class Runlist < ActiveRecord::Base
  attr_accessible :task_id, :testcase_id, :task, :testcase
  belongs_to :task
  has_one :testcase
end
