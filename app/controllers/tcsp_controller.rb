class TcspController < ApplicationController
  
  
  
    def new
         @teststep = Teststep.new
         
         respond_to do |format|
                 format.html
                 format.json {render json: @teststeps}
         end 
  end
  
  
  def show

        @tc = Testcase.where("id = #{params[:id]}").first
        
        @steps = Teststep.order(:step).where("testCaseName='#{@tc.name}'")

        session[:testcaseid] = params[:id]
  end

  def index 
        
        @tc = Testcase.find(params[:testcase_id])
        
        @steps = Teststep.order(:step).where("testCaseName='#{@tc.name}'")
        
        session[:testcaseid] = params[:testcase_id]
        
  end


  def delete
  end
end
