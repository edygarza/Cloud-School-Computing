class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_one :school
  belongs_to :school

  attr_accessible :username, :email, :password, :password_confirmation, :first_name, :last_name,
		  :home_phone, :office_phone, :cell_phone, :address
 
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_uniqueness_of :email
end
