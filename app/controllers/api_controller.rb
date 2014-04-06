include ApiHelper

class ApiController < ApplicationController
  def getTimeTable
    @teachers_json = ActiveSupport::JSON.encode(extract_teacher_map_all)
  end
end
