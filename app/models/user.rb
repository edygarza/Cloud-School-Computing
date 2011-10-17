class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  has_many :groups, :dependent => :destroy
  has_one :school
  belongs_to :school

  attr_accessible :username, :email, :password, :password_confirmation, :first_name, :last_name,
		  :home_phone, :office_phone, :cell_phone, :address, :admin, :director, :assistant,
		  :teacher
 
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :username
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_numericality_of :home_phone, :message => "debe ser formado de puros digitos" 
  validates :home_phone, :length => { :minimum => 8, :message => "debe contener al menos 8 digitos" }
  validates_numericality_of :office_phone, :message => "debe ser formado de puros digitos"  
  validates :office_phone, :length => { :minimum => 8, :message => "debe contener al menos 8 digitos" }
  validates_numericality_of :cell_phone, :message => "debe ser formado de puros digitos"  
  validates :cell_phone, :length => { :minimum => 8, :message => "debe contener al menos 8 digitos" }
  validates_presence_of :address
  validates_uniqueness_of :username
  validates_uniqueness_of :email
end
