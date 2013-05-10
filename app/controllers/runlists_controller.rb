class RunlistsController < ApplicationController
  
  respond_to :json, :html
  
  def update
          @runlist = Runlist.find(params[:id])
          @runlist.update_attributes(params[:runlist])
          respond_with @runlist

  end

  def show
                  @runlist = Runlist.find(params[:id])
  end
end
