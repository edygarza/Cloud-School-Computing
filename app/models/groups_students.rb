class GroupsStudents < ActiveRecord::Base
  belongs_to :group
  belongs_to :student

  attr_accessible :group_id, :student_id
end
