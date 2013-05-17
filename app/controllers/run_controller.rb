class RunController < ApplicationController
  

  def start
          
          
          
  end
  
  
  
  def check_machine_situ
          Task.all.each do |task|
                 system("staf #{task.runmachine} ping ping > #{task.runmachine}.log")
                File.open("#{task.runmachine}.log", "r") do |f|
                                session[task.runmachine] = f.readlines.join.gsub("\n","")
               end
          end
          redirect_to root_path
  end

   def run_refer_task
          task = Task.find(params[:id])
          system("staf #{task.runmachine} var set shared var task=#{params[:id]} > #{task.runmachine}.run.log")
          system("staf #{task.runmachine} process start command ruby #{task.path}run.rb >> #{task.runmachine}.run.log")
           File.open("#{task.runmachine}.run.log","r") do |f|
                   info = f.readlines.join
                   if info.downcase.include?("error")
                           redirect_to root_path, :notice => "#{task.runmachine} error: #{info}"
                   end
           end
           redirect_to root_path
   end

  def  show_smoketest
  end

   def check_smma_situ
           system("staf 10.57.4.30 ping ping > 10.57.4.30.log")
           File.open("10.57.4.30.log", "r") do |f|
                   session["10.57.4.30"] = f.readlines.join.gsub("\n","")
           end
           redirect_to run_smoketest_path
   end

   def run_pre_smoke
           system("staf 10.57.4.30 process start command ruby C:/DeployTest/PreDeployTest.rb >> 10.57.4.30.pre.log")
                redirect_to run_smoketest_path
   end

   def run_sit_smoke
           system("staf 10.57.4.30 process start command ruby C:/DeployTest/SitDeployTest.rb >> 10.57.4.30.pre.log")
                redirect_to run_smoketest_path
   end
           
   def run_uat_smoke
           system("staf 10.57.4.30 process start command ruby C:/DeployTest/UatDeployTest.rb >> 10.57.4.30.pre.log")
                redirect_to run_smoketest_path
   end
   
end
