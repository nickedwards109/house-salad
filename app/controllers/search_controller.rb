class SearchController < ApplicationController
  def index
    connection = Faraday.new(url: "https://api.propublica.org/congress/v1/members/house/#{params[:state]}/current.json")
    connection.headers['X-API-Key'] = ENV['api_key']
    response = connection.get
    raw_representatives = JSON.parse(response.body)
    byebug
  end
end
