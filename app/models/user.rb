class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  has_many :groups, :dependent => :destroy
  has_one :school
  belongs_to :school

  attr_accessible :username, :email, :password, :password_confirmation, :first_name, :last_name,
		  :home_phone, :office_phone, :cell_phone, :address, :admin, :director, :assistant,
		  :teacher, :school_id
 
  validates_uniqueness_of :username
  validates :password, :length => { :minimum => 6 }, :confirmation => true
  validates_presence_of :password, :on => :create
  validates_format_of :email, :with => /\A[^@]+@[^@]+\z/
  validates :home_phone, :office_phone, :cell_phone, :numericality => true, :length => { :in => 7..10 }
  validates :username, :first_name, :last_name, :home_phone, :address, :presence => true
end
