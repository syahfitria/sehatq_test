class CreateBookDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :book_doctors do |t|
      t.integer :doctor_id
      t.integer :hospital_id
      t.integer :user_id
      t.datetime :book_date
      t.timestamps
    end
  end
end
