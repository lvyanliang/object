class TcsController < ApplicationController
        
        def show
                @task = Task.where("id = #{params[:id]}")
                session[:taskid] = params[:id]
                @runlists = Runlist.where("taskid = #{params[:id]}")
                @tcs = []
                @runlists.each do |rl|
                        @tcs << Testcase.where("id = #{rl.testcaseid}")
                end
                @tcs.flatten! if @tcs != nil
        end        
end
