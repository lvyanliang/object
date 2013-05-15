class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.int :testcase_id
      t.string :result
      t.integer :counter
      t.time :finishtime

      t.timestamps
    end
  end
end
