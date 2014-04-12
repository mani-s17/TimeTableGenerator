include ApiHelper
require 'net/http'

class ApiController < ApplicationController
  def getTimeTable
    @combined_json = extract_api_input.to_json
    #TODO:Move Url to Config
    url = 'http://timetable-generator.mani-s17.cloudbees.net/rest/generate/'
    response = do_post(url,@combined_json)
    @api_output = "Response #{response.code} #{response.message}: #{response.body}"
  end

  private def do_post(url,json_data)
    uri = URI(url)
    req = Net::HTTP::Post.new(uri)
    # req.basic_auth @user, @pass
    req.content_type = 'application/json'
    req.body = json_data
    Net::HTTP.new(uri.hostname, uri.port).request(req)
  end
end
