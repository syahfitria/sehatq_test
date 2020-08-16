require 'rails_helper'
describe Api::V1::HospitalsController, :type => :controller do
  context 'when the hospitals exist' do

    it "get all hospitals" do
      auth_token = User.first.auth_token
      get(:index)
      expect(JSON.parse(response.body).size)
    end
  end
end