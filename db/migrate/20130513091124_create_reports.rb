class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.time :runtime
      t.integer :stepid
      t.string :result
      t.string :actualvalue
      t.integer :counter

      t.timestamps
    end
  end
end
