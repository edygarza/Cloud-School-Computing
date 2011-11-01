class Group < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  belongs_to :school
  has_many :group_students
  has_many :students, :through => :group_students
  has_many :activities

  attr_accessible :school_id, :user_id, :subject_id, :classroom
  validates :classroom, :length => { :minimum => 3, :message => "debe contener al menos 3 digitos" }
end
