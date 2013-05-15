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
          system("staf #{task.runmachine} process start command ruby #{task.path}run.rb > #{task.runmachine}.run.log")
           File.open("#{task.runmachine}.run.log","r") do |f|
                   info = f.readlines.join
                   if info.downcase.include?("error")
                           redirect_to root_path, :notice => "#{task.runmachine} error: #{info}"
                   end
           end
           redirect_to root_path
           
   end

end
