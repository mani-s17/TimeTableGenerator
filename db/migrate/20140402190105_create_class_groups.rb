class CreateClassGroups < ActiveRecord::Migration
  def change
    create_table :class_groups do |t|
      t.string :name
      t.integer :standard
      t.integer :size

      t.timestamps
    end
  end
end
