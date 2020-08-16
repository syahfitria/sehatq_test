class AddRemoveAndChangeOnBookDoctor < ActiveRecord::Migration[5.2]
  def change
    remove_column :book_doctors, :hospital_id
    remove_column :book_doctors, :doctor_id
    add_column :book_doctors, :hospital_doctor_id, :integer
    add_column :book_doctors, :numbers, :integer
  end
end
