# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Hospital.first.blank?
  ActiveRecord::Base.connection.execute("TRUNCATE table hospitals")
  puts 'seeding table hospital . . .'
  Hospital.create!([
    { name: "Hospital A", address: "Jakarta Timur"},
    { name: "Hospital B", address: "Jakarta Barat"},
    { name: "Hospital C", address: "Jakarta Selatan"},
    { name: "Hospital D", address: "Jakarta Pusat"}
   ])
else
  puts "not seeding Hospital table"
end

if Doctor.first.blank?
  ActiveRecord::Base.connection.execute("TRUNCATE table doctors")
  puts 'seeding table doctors . . .'
  Doctor.create!([
    { name: "Doctor Andi"},
    { name: "Doctor Budi"},
    { name: "Doctor Ahmad"},
    { name: "Doctor Laila"}
   ])
else
  puts "not seeding Doctor table"
end

if HospitalDoctor.first.blank?
  ActiveRecord::Base.connection.execute("TRUNCATE table hospital_doctors")
  puts 'seeding table hospital doctors . . .'
  HospitalDoctor.create!([
    {hospital_id: 1, doctor_id:1, schedule: "14:00:00"},
    {hospital_id: 1, doctor_id:2, schedule: "16:00:00"},
    {hospital_id: 1, doctor_id:3, schedule: "18:00:00"},
    {hospital_id: 2, doctor_id:2, schedule: "10:00:00"},
    {hospital_id: 2, doctor_id:3, schedule: "11:00:00"},
    {hospital_id: 3, doctor_id:4, schedule: "08:00:00"},
    {hospital_id: 4, doctor_id:1, schedule: "09:00:00"},
    {hospital_id: 4, doctor_id:3, schedule: "07:30:00"}
   ])
else
  puts "not seeding Hospital Doctor table"
end

if User.first.blank?
  ActiveRecord::Base.connection.execute("TRUNCATE table users")
  puts 'seeding table user . . .'
  for i in 0..10
    User.create!(name: "User #{i}", password: "12345678", password_confirmation: "12345678", auth_token: User.generate_token, email: "user#{i}@gmail.com")
  end
else
  puts "not seeding User table"
end