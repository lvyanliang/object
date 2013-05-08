class TcspController < ApplicationController
  
  def show
        
        @tc = Testcase.where("id = #{params[:id]}").first
        @steps = Teststep.order(:step).where("testCaseName='#{@tc.name}'")
                
  end

  def new
  end

  def delete
  end
end
