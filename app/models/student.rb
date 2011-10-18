class Student < ActiveRecord::Base
  belongs_to :school
  mount_uploader :avatar, AvatarUploader
  has_many :groups, :dependent => :destroy

  attr_accessible :school_id, :registration_number, :first_name, :last_name, :home_phone, :cell_phone, :notes,
		  :semester, :entry_date, :tutor, :tutor_phone, :avatar, :street_name, :street_number, :district,
		  :city, :state, :country, :tutor_street_name, :tutor_street_number, :tutor_district, :tutor_city,
		  :tutor_state, :tutor_country
end
