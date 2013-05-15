class TcsController < ApplicationController
        
        def show
                @task = Task.where("id = #{params[:id]}")
                session[:taskid] = params[:id]
                @runlists = Runlist.where("taskid = #{params[:id]}")
                @tcs = []
                @runlists.each do |rl|
                        @tcs << Testcase.where("id = #{rl.testcase_id}")
                end
                @tcs.flatten! if @tcs != nil
        end   
        
        
        def index
                @task = Task.find(params[:task_id])
                session[:taskid] = params[:task_id]
                @runlists = Runlist.where("task_id = #{params[:task_id]}")
                @tcs = []
                @runlists.each do |rl|
                        @tcs << Testcase.where("id = #{rl.testcase_id}")
                end
                @tcs.flatten! if @tcs != nil
        end     
        
        
        def new
                @testcase = Testcase.new

        end
        
        def create
                @testcase = Testcase.new(params[:testcase])
                 @runlist = Runlist.new
                @runlist.task_id = session[:taskid]
                respond_to do |format|
                        if  @testcase.save
                                @runlist.testcase_id = @testcase.id
                                @runlist.save
                                format.html{ redirect_to task_testcases_path(session[:taskid])}
                        else
                                format.html {redirect_to root_path, notice: "wrong!"}
                        end
                end
        end
        
end
