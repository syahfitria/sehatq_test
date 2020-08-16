class Api::V1::DoctorsController < ApplicationController
  before_action :authenticate_user
  def index
    doctors = Doctor.joins(hospital_doctors: :hospital).all
    list_doctor = []
    doctors.each do |doctor|
      list_hospital = []
      doctor.hospital_doctors.each do |hospital|
        list_hospital << {
            id: hospital.hospital.try(:id),
            name: hospital.hospital.try(:name),
            address: hospital.hospital.try(:address),
            schedule: hospital.schedule.strftime("%H:%M"),
            hospital_doctor_id: hospital.id
        }
      end
      list_doctor << {id: doctor.id, name: doctor.name, hospital: list_hospital }
    end
    return render json: {
      meta: {
        code: 200,
        message: "success"
      },
      data: list_doctor
      }
  end

end
