require 'rails_helper'

RSpec.describe "Representatives" do
  it "sorts a state's representatives by seniority" do
    representatives = Representative.find_by_state("CO")
    expect(representatives.count).to eq(7)
    expect(representatives[0].seniority.to_i >= representatives[1].seniority.to_i).to be true
    expect(representatives[1].seniority.to_i >= representatives[2].seniority.to_i).to be true
    expect(representatives[2].seniority.to_i >= representatives[3].seniority.to_i).to be true
    expect(representatives[3].seniority.to_i >= representatives[4].seniority.to_i).to be true
    expect(representatives[4].seniority.to_i >= representatives[5].seniority.to_i).to be true
    expect(representatives[5].seniority.to_i >= representatives[6].seniority.to_i).to be true
  end
end
