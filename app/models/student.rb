class Student < ActiveRecord::Base
  belongs_to :school
  mount_uploader :avatar, AvatarUploader
  has_many :groups, :dependent => :destroy

  attr_accessible :school_id, :registration_number, :first_name, :last_name, :home_phone, :cell_phone, :address, :notes,
		  :semester, :entry_date, :tutor, :tutor_address, :tutor_phone, :avatar
end
