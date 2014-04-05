class CreateSubjectStandards < ActiveRecord::Migration
  def change
    create_table :subject_standards do |t|
      t.integer :subject_id
      t.integer :standard_id

      t.timestamps
    end
  end
end
