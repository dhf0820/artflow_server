require 'rspec'
require 'rails_helper'

describe 'Artist Queue Management', type: :request do
  let(:pcf) {FactoryGirl.create(:pcf)}
  let(:request1) {FactoryGirl.create(:pending_base_card)}

  it 'should return the next job' do

    get "/api/artist/#{pcf.id}/nextjob"

    expect(response.body).to include 'card_back_specs'


  end
end