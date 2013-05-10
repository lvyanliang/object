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
  
    def  create
          @teststep = Teststep.new(params[:teststep])
          tcname = Testcase.find(session[:testcaseid]).name
          @teststep.step = Teststep.where(["testCaseName = ?", tcname]).count + 1
          @teststep.testCaseName = tcname
          if @teststep.save
                  redirect_to tcsp_path(session[:testcaseid])
          end
          
          # respond_to do |format|
             # if @teststep.save
                # format.html { redirect_to teststep, notice: 'Testobject was successfully created.' }
                # format.json { render json: @teststep, status: :created, location: @teststep }
             # else
                # format.html { render action: "new" }
                # format.json { render json: @teststep.errors, status: :unprocessable_entity }
             # end    
          # end

  end
  
  
end
