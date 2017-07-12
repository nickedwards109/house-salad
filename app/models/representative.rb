class Representative
  def self.find_by_state(state_abbreviation)
    connection = Faraday.new(url: "https://api.propublica.org/congress/v1/members/house/#{state_abbreviation}/current.json")
    connection.headers['X-API-Key'] = ENV['api_key']
    response = connection.get
    raw_representatives = JSON.parse(response.body)["results"]
    representatives_backwards_sorted = raw_representatives.sort_by do |representative|
      representative["seniority"].to_i
    end
    representatives_sorted = representatives_backwards_sorted.reverse
  end
end
