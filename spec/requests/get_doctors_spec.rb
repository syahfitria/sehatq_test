require 'rails_helper'
describe Api::V1::DoctorsController, :type => :controller do
  context 'when the doctors exist' do

    it "get all doctors" do
      auth_token = User.first.auth_token
      get(:index)
      expect(JSON.parse(response.body).size)
    end
  end
end