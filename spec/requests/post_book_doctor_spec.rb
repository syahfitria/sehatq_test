require 'rails_helper'
describe Api::V1::BookDoctorsController, :type => :controller do
  context 'when the hospitals exist' do

    it "get all hospitals" do
      user = User.last
      post :create, params: {
        auth_token: user.auth_token,
        book_doctor: {
          hospital_doctor_id: 1,
          user_id: user.id,
          book_date: "2020-08-31",
          numbers: rand(1..10)
      }
    }
    expect(JSON.parse(response.body).size)
    end
  end
end