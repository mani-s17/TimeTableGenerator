include ApiHelper

class ApiController < ApplicationController
  def getTimeTable
    @combined_json = ActiveSupport::JSON.encode(extract_api_input)
  end

end
