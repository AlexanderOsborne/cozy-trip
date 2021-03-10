require 'rails_helper'

RSpec.describe 'Returns formatted traveltime'do
  it 'Returns time less than a day' do

    data = {route: {realTime: 85000}}
    traveltime = Traveltime.new(data)
    expect(traveltime.travel_time).to be_a(String)
    expect(traveltime.travel_time).to eq("23 hours 36 min")
  end

  it 'Returns time more than a day' do

    data = {route: {realTime: 890000}}
    traveltime = Traveltime.new(data)
    expect(traveltime.travel_time).to be_a(String)
    expect(traveltime.travel_time).to eq("10 days  7 hours 13 minutes")
  end
end