class CreateHospitalDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :hospital_doctors do |t|
      t.integer :doctor_id
      t.integer :hospital_id
      t.time :schedule
      t.timestamps
    end
  end
end
