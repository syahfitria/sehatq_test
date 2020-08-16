class Api::V1::HospitalsController < ApplicationController
  before_action :authenticate_user
  def index
    hospitals = Hospital.all
    list_hospital = []
    hospitals.each do |hospital|
      list_hospital << {id: hospital.id, name: hospital.name, address: hospital.address}
    end
    render json: {
    meta: {
      code: 200,
      message: "success"
    },
    data:list_hospital
    }
  end

  def hospital_doctor
    hospital_doctors = Hospital.joins(hospital_doctors: :doctor).where("hospitals.id = ?", params[:hospital_id]).first
    # hospital_doctors.each do |hospital_doctor|
      list_doctor = []
      hospital_doctors.hospital_doctors.each do |doctor|
        list_doctor << {
          id: doctor.doctor.try(:id),
          name: doctor.doctor.try(:name),
          schedule: doctor.schedule.strftime("%H:%M"),
          hospital_doctor_id: doctor.id
        }
      end
      data = {id: hospital_doctors.id, name: hospital_doctors.name, list_doctor: list_doctor}
    # end
    render json: {
      meta: {
        code: 200,
        message: "success"
      },
      data: data
      }
  end
end
