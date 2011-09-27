class Student < ActiveRecord::Base
  belongs_to :school

  attr_accessible :school_id, :registration_number, :first_name, :last_name, :father, :mother, :home_phone, :cell_phone, :address, :notes
end
