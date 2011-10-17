class Group < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  belongs_to :school

  attr_accessible :school_id, :user_id, :subject_id, :classroom
  validates :classroom, :length => { :minimum => 3, :message => "debe contener al menos 3 digitos" }
end
