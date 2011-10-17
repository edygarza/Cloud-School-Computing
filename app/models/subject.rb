class Subject < ActiveRecord::Base
  belongs_to :school
  has_many :groups, :dependent => :destroy

  attr_accessible :name, :key, :units
end
