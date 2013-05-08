class CreateTeststeps < ActiveRecord::Migration
  def change
    create_table :teststeps do |t|
      t.string :testcaseName
      t.integer :step
      t.string :stepDesc
      t.string :stepMethod
      t.string :objName
      t.string :callMethod
      t.string :inputValue
      t.string :expectValue
      t.string :runFlag

      t.timestamps
    end
  end
end
