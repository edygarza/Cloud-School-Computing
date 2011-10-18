class Subject < ActiveRecord::Base
  belongs_to :school
  has_many :groups, :dependent => :destroy

  attr_accessible :name, :key, :units

  validates_uniqueness_of :key, :scope => :school_id
  validates :key, :units, :name, :presence => true
  validates :units, :numericality => true
end
