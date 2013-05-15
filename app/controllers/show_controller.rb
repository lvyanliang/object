class ShowController < ApplicationController
  
  def show_tkrp
                   @tasks = Task.find(:all)
  end

  def show_tcrps
        @testcase = Testcase.find(params[:id])
        @results = Summary.order(:counter).where(["testcase_id = ?", params[:id]])
  end

  def show_steps
           @testcase = Testcase.find(params[:tc_id])
           @results = Result.order(:teststep_id).where(["testCaseName = ? and counter = ?" , @testcase.name, params[:id]])
           @teststeps = {}
           @results.each do |rl|
                   @teststeps[rl.teststep_id] = Teststep.find(rl.teststep_id)
           end
  end
  

end
