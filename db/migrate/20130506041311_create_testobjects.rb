class CreateTestobjects < ActiveRecord::Migration
  def change
    create_table :testobjects do |t|
      t.string :name
      t.string :page
      t.string :eltype
      t.string :how
      t.string :property
      t.string :comment

      t.timestamps
    end
  end
end
