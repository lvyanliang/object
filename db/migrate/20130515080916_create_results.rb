class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.time :runtime
      t.integer :teststep_id
      t.string :result
      t.string :actualvalue
      t.int :counter
      t.string :testCaseName

      t.timestamps
    end
  end
end
