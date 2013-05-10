#encoding: utf-8

module TestcasesHelper
        
        def get_rl(opt)
                return Runlist.where("testcaseid = #{opt}")
        end
        
        def  sl_task
                sl_tks = [["","暂不关联"]]        
                Task.order(:id).find(:all).each  do |tk|
                      sl_tks  <<( [] << tk.id << tk.name )               
                end
                return sl_tks
        end
        
        def sl_task_reverse
                sl_tks = [["暂不关联",""]]        
                Task.order(:id).find(:all).each  do |tk|
                      sl_tks  <<( [] << tk.name << tk.id)               
                end
                return sl_tks
        end
        
end
