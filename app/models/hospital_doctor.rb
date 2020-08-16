class HospitalDoctor < ApplicationRecord
  belongs_to :doctor
  belongs_to :hospital
  has_many :book_doctors
end
