
class School < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  has_many :users, :dependent => :destroy
  has_many :students, :dependent => :destroy
  has_many :subjects, :dependent => :destroy	
  has_many :groups, :dependent => :destroy

  attr_accessible :owner_id, :name, :description, :street_number, :telephone,
		  :zip_code, :country, :street_name, :district, :city, :state
  validates :name, :description, :street_name, :street_number, :district, :city, :state, :country, :presence => true
  validates :telephone, :numericality => true, :length => { :in => 7..10 }, :presence => true
  validates :zip_code, :numericality => true, :presence => true
end

