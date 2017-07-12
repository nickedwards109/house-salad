require 'rails_helper'

RSpec.describe "ProPublicaService" do
  it "gets all of a state's representatives" do
    representatives = ProPublicaService.get_all_reps("CO")
    expect(representatives.count).to eq(7)
    expect(representatives).to be_an Array
    expect(representatives.first).to be_a Hash
    expect(representatives.first).to have_key("name")
    expect(representatives.first["name"]).to be_a String
    expect(representatives.first).to have_key("role")
    expect(representatives.first["role"]).to be_a String
    expect(representatives.first).to have_key("party")
    expect(representatives.first["party"]).to be_a String
    expect(representatives.first).to have_key("district")
    expect(representatives.first["district"]).to be_a String
    expect(representatives.first).to have_key("seniority")
    expect(representatives.first["seniority"]).to be_a String
  end
end
