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

  def extract_teacher_map_all
    teachers = Array.new
    Teacher.all.each { |teacher|
      teachers.push(extract_teacher_map(teacher))
    }
    teachers
  end


  def extract_class_group_map(class_group)
    class_group_map = Hash.new
    class_group_map['id']= class_group.id
    class_group_map['standardId'] = class_group.standard_id

    subject_to_hour_map = Hash.new
    class_group.group_subjects.each do |group_subject|
      subject_to_hour_map[group_subject.subject.code] = group_subject.hours_required
    end
    class_group_map['subjectToHourMap'] = subject_to_hour_map

    class_group_map
  end

  def extract_class_group_map_all
    class_groups = Array.new
    ClassGroup.all.each { |class_group|
      class_groups.push(extract_class_group_map(class_group))
    }
    class_groups
  end

  def extract_api_input
    input_map = Hash.new
    #TODO:Read from Config
    input_map['workingDays'] = 5
    input_map['periodPerDay'] = 8
    input_map['teachers'] = extract_teacher_map_all
    input_map['classGroups'] = extract_class_group_map_all
    input_map
  end
end
