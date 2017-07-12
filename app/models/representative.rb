class Representative
  attr_reader :name, :role, :party, :district, :seniority

  def initialize(name, role, party, district, seniority)
    @name = name
    @role = role
    @party = party
    @district = district
    @seniority = seniority
  end

  def self.find_by_state(state_abbreviation)
    representatives = ProPublicaService.get_all_reps(state_abbreviation)
    sorted_representatives = sort_representatives(representatives)
    sorted_representatives.map do |representative|
      new(representative["name"],
          representative["role"],
          representative["party"],
          representative["district"],
          representative["seniority"])
    end
  end

  def self.sort_representatives(representatives)
    representatives_backwards_sorted = representatives.sort_by do |representative|
      representative["seniority"].to_i
    end
    representatives_sorted = representatives_backwards_sorted.reverse
  end
end
