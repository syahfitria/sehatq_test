class Api::V1::BookDoctorsController < ApplicationController
  before_action :authenticate_user

  def index
    list_book_events = []
    condition = []
    condition << "hospital_doctors.hospital_id = #{params[:hospital_id]} " if params[:hospital_id].present?
    condition << "hospital_doctors.doctor_id = #{params[:doctor_id]} " if params[:doctor_id].present?
    condition << "DATE(book_doctors).book_date = '#{params[:date].to_date.strftime('%Y-%m-%d')}'" if params[:date].present?
    booking_list = HospitalDoctor.joins(:doctor, :hospital, book_doctors: :user).where(condition.join(" AND "))
    data = []
    booking_list.each do |booking_list|
      list_patient = []
      booking_list.book_doctors.each do |book_doctor|
        list_patient << {
          user_id: book_doctor.user.id,
          name: book_doctor.user.name,
          book_date: book_doctor.book_date.to_date.strftime('%Y-%m-%d'),
          queue_number: book_doctor.numbers
        }
      end

      data << {
        doctor_id: booking_list.doctor_id,
        doctor_name: booking_list.doctor.name,
        hospital_id: booking_list.hospital_id,
        hospital_name: booking_list.hospital.name,
        book_list: list_patient
      }
    end
    render json: {
      meta: {
      code: 200,
      message: "Success"
      },
      data: data
    }
  end

  def create
    hospital_doctor = HospitalDoctor.where(id: params_book_doctors[:hospital_doctor_id]).first
    schedule_time = hospital_doctor.schedule - 30.minutes
    book_date = DateTime.parse(params_book_doctors[:book_date])
    count_book = BookDoctor.where("book_doctors.hospital_doctor_id = ? AND DATE(book_date) = ?", params_book_doctors[:hospital_doctor_id], book_date.to_date).count
    if count_book < 10
      if book_date.to_date == Date.today && book_date.strftime("%H:%M") <= schedule_time.strftime("%H:%M")
        book_doctor = BookDoctor.new(params_book_doctors)
        if book_doctor.save
          render json: {
            meta: {
            code: 200,
            message: "Data booking dokter telah tersimpan"
            },
            data: params_book_doctors
          }
        end
      elsif book_date.to_date > Date.today
        book_doctor = BookDoctor.new(params_book_doctors)
        if book_doctor.save
          render json: {
            meta: {
            code: 200,
            message: "Data booking dokter telah tersimpan"
            },
            data: params_book_doctors
          }
        end
      else
        render json: {
          meta: {
            code: 400,
            message: "Lebih dari Jadwal Dokter"
          },
          data: {}
        }
      end
    else
      render json: {
        meta: {
          code: 400,
          message: "Maaf, Dokter telah mencapai jumlah maksimum pasien"
        },
        data: {}
      }
    end
  end

  private
  def params_book_doctors
    params.require(:book_doctor).permit(:user_id, :hospital_doctor_id, :book_date, :numbers)
  end
end
