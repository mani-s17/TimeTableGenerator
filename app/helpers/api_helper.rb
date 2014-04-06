module ApiHelper
  def extract_teacher_map(teacher)
    teacher_map = Hash.new
    teacher_map['id'] = teacher.id
    teacher_map['hours'] = teacher.teaching_hours
    standard_to_subject_map = Hash.new

    Standard.all.each do |standard|
      standard_to_subject_map[standard.id] = Array.new
    end

    teacher.subject_standards.each { |subject_standard|
      standard_to_subject_map[subject_standard.standard_id].push(subject_standard.subject.code)
    }
    teacher_map['standardToSubjectMap'] = standard_to_subject_map
    teacher_map
  end
end
