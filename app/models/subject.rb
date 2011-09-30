class Subject < ActiveRecord::Base
  has_one :school
  belongs_to :school

  attr_accessible :name
end
