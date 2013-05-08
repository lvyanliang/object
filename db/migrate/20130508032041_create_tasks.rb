class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :runmachine
      t.time :runtime

      t.timestamps
    end
  end
end
