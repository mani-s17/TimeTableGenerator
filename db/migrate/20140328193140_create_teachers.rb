class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.integer :teaching_hours

      t.timestamps
    end
  end
end
