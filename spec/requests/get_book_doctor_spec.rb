require 'rails_helper'
describe Api::V1::BookDoctorsController, :type => :controller do
  context 'when the book doctors exist' do

    it "get all book doctors" do
      auth_token = User.first.auth_token
      get(:index)
      expect(JSON.parse(response.body).size)
    end
  end
end