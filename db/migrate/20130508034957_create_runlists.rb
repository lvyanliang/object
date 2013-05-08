class CreateRunlists < ActiveRecord::Migration
  def change
    create_table :runlists do |t|
      t.integer :testcaseid
      t.integer :taskid

      t.timestamps
    end
  end
end
