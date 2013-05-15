class CreateRunlists < ActiveRecord::Migration
  def change
    create_table :runlists do |t|
      t.integer :testcase_id
      t.integer :task_id

      t.timestamps
    end
  end
end
