class Student < ActiveRecord::Base
  belongs_to :school
  mount_uploader :avatar, AvatarUploader
  has_many :group_students
  has_many :groups, :through => :group_students

  attr_accessible :school_id, :registration_number, :first_name, :last_name, :home_phone, :cell_phone, :notes,
		  :semester, :entry_date, :tutor, :tutor_phone, :avatar, :street_name, :street_number, :district,
		  :city, :state, :country, :tutor_street_name, :tutor_street_number, :tutor_district, :tutor_city,
		  :tutor_state, :tutor_country

  validates :registration_number, :first_name, :last_name, :semester, :entry_date, :tutor, :tutor_phone, :presence => true
  validates_uniqueness_of :registration_number, :scope => :school_id
  validates :first_name, :last_name, :format => { :with => /\A[a-zA-Z]+\z/ }
  validates :tutor_phone, :length => { :in => 7..10 }
  validates :cell_phone, :home_phone, :length => { :in => 7..10 }, :allow_nil => true
end
