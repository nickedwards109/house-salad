class ProPublicaService
  def self.get_all_reps(state_abbreviation)
    connection = Faraday.new(url: "https://api.propublica.org/congress/v1/members/house/#{state_abbreviation}/current.json")
    connection.headers['X-API-Key'] = ENV['api_key']
    response = connection.get
    raw_representatives = JSON.parse(response.body)["results"]
  end
end
