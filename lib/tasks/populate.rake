namespace :db do
  desc "Erase and fill dummy info on database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [User, School, Student, Subject].each(&:delete_all)

    User.populate 1 do |user|
      user.username = "director"
      user.crypted_password = User.encrypt("test")
      user.first_name = Faker::Name.first_name
      user.last_name = Faker::Name.last_name
      user.home_phone = Faker::PhoneNumber.phone_number.delete("^0-9")[0..9]
      user.office_phone = Faker::PhoneNumber.phone_number.delete("^0-9")[0..9]
      user.cell_phone = Faker::PhoneNumber.phone_number.delete("^0-9")[0..9]
      user.address = Faker::Address.street_address
      user.email = Faker::Internet.email
      user.director = "t"
    end

    School.populate 3 do |school|
      school.name = Populator.words(1..2).capitalize
      school.owner_id = 1
      school.description = Populator.sentences(10..20)
      school.street_name = Faker::Address.street_name
      school.street_number = 1..9999
      school.district = ""
      school.city = Faker::Address.city
      school.state = Faker::Address.us_state      
      school.zip_code = Faker::Address.uk_postcode
      school.country = "United States"
      school.telephone = Faker::PhoneNumber.phone_number.delete("^0-9")[0..9]

      User.populate 5..30 do |user|
        user.school_id = school.id
        user.username = Faker::Internet.user_name
      	user.crypted_password = User.encrypt("test")
      	user.first_name = Faker::Name.first_name
      	user.last_name = Faker::Name.last_name
      	user.home_phone = Faker::PhoneNumber.phone_number.delete("^0-9")[0..9]
      	user.office_phone = Faker::PhoneNumber.phone_number.delete("^0-9")[0..9]
      	user.cell_phone = Faker::PhoneNumber.phone_number.delete("^0-9")[0..9]
      	user.address =  Faker::Address.street_address
      	user.email = Faker::Internet.email
      	user.admin = "f"
      	user.director = ["t","f"]
      	user.assistant = ["t","f"]
      	user.teacher = ["t","f"]
      end

      Student.populate 25..50 do |student|
	student.school_id = school.id
	student.registration_number = 600000..1000000
	student.first_name = Faker::Name.first_name
	student.last_name = Faker::Name.last_name
        student.street_name = Faker::Address.street_name
	student.street_number = 1000..9999
	student.district = ""
	student.city = Faker::Address.city
	student.state = Faker::Address.us_state
	student.country = "United States"
	student.semester = 1..9
	student.entry_date = 5.years.ago..1.year.ago
	student.tutor = Faker::Name.name
	student.tutor_street_name = Faker::Address.street_name
        student.tutor_street_number = 1000..9999
        student.tutor_district = ""
        student.tutor_city = Faker::Address.city
        student.tutor_state = Faker::Address.us_state
        student.tutor_country = "United States"
	student.tutor_phone = Faker::PhoneNumber.phone_number.delete("^0-9")[0..9]
	student.home_phone = Faker::PhoneNumber.phone_number.delete("^0-9")[0..9]
	student.cell_phone = Faker::PhoneNumber.phone_number.delete("^0-9")[0..9]
	student.notes = Populator.paragraphs(1..3)
      end

      Subject.populate 10..15 do |subject|
	subject.school_id = school.id
	subject.key = 1000...1100
	subject.name = Populator.words(1..3)
	subject.units = 6..12
      end
    end
  end
end
