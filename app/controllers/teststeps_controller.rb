class TeststepsController < ApplicationController
  
  respond_to :json,:html
  
  def show
          @teststep = Teststep.find(params[:id])
  end

  def update
          @teststep = Teststep.find(params[:id])
          @teststep.update_attributes(params[:teststep])
          respond_with @teststep
  end
  
  def destroy
                
  end
  
  
end
