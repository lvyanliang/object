class TestcasesController < ApplicationController
  # GET /testcases
  # GET /testcases.json
  def index
    @testcases = Testcase.all
 
     @tktcs = []
     @testcases.each do |tc|
             rls  = Runlist.where(["testcase_id=?", tc.id])
             begin 
                     @tktcs << Task.where(["id=?",rls.first.task_id]).first.name
             rescue StandardError
                     @tktcs << "-"
             end
     end
     
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @testcases }
    end
  end

  # GET /testcases/1
  # GET /testcases/1.json
  def show
    @testcase = Testcase.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @testcase }
    end
  end

  # GET /testcases/new
  # GET /testcases/new.json
  def new
    @testcase = Testcase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @testcase }
    end
  end

  # GET /testcases/1/edit
  def edit
    @testcase = Testcase.find(params[:id])
  end

  # POST /testcases
  # POST /testcases.json
  def create
    @testcase = Testcase.new(params[:testcase])
        @runlist = Runlist.new(params[:runlist])

    respond_to do |format|
      if @testcase.save
        @runlist.testcaseid = @testcase.id
        @runlist.save
        format.html { redirect_to @testcase, notice: 'Testcase was successfully created.' }
        format.json { render json: @testcase, status: :created, location: @testcase }
      else
        format.html { render action: "new" }
        format.json { render json: @testcase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /testcases/1
  # PUT /testcases/1.json
  def update
    @testcase = Testcase.find(params[:id])

    respond_to do |format|
      if @testcase.update_attributes(params[:testcase])
        format.html { redirect_to @testcase, notice: 'Testcase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @testcase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testcases/1
  # DELETE /testcases/1.json
  def destroy
    @testcase = Testcase.find(params[:id])
    
    @testcase.destroy
    
    Teststep.destroy_all("teststeps.testcaseName = '#{@testcase.name}'")

    respond_to do |format|
      format.html { redirect_to testcases_url }
      format.json { head :no_content }
    end
  end
end
