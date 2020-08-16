class BookDoctor < ApplicationRecord
  belongs_to :hospital_doctor
  belongs_to :user
end
