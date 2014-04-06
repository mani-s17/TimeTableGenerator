include ApiHelper

class ApiController < ApplicationController
  def getTimeTable
    @teachers_json = ActiveSupport::JSON.encode(extract_teacher_map_all)
    @class_groups_json = ActiveSupport::JSON.encode(extract_class_group_map_all)
  end

end
