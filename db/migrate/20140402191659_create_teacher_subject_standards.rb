class CreateTeacherSubjectStandards < ActiveRecord::Migration
  def change
    create_table :teacher_subject_standards do |t|
      t.integer :teacher_id
      t.integer :subject_standard_id

      t.timestamps
    end
  end
end
