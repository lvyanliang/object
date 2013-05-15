module TasksHelper
        
        def show_task_relative_result(task)
               @testcases,@results  = [], []
                runlists = Runlist.order(:testcase_id).where(["task_id = ?", task.id])
                runlists.each do |rl|
                        @testcases << Testcase.find(rl.testcase_id)
                        @results << Summary.where(["testcase_id = ? and counter = ?", rl.testcase_id, task.counter]).first
                end
        end
        
end
