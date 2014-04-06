class CreateGroupSubjects < ActiveRecord::Migration
  def change
    create_table :group_subjects do |t|
      t.integer :class_group_id
      t.integer :subject_id
      t.integer :hours_required

      t.timestamps
    end
  end
end
