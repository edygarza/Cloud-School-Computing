class Teacher < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :email, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates_numericality_of :telephone
end
