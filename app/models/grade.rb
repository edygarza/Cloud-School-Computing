class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :activity

  attr_accessible :student_id, :activity_id, :grade

  validates :grade, :allow_nil => true, :allow_blank => true, :numericality => true
end
