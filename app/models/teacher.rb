class Teacher < ActiveRecord::Base
  belongs_to :school
  has_one :user

  attr_accessible :school_id, :user_id
end
