class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :activity

  attr_accessible :student_id, :activity_id, :grade
end
