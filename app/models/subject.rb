class Subject < ActiveRecord::Base
  belongs_to :school

  attr_accessible :name, :key, :units
end
