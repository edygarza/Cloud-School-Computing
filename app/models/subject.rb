class Subject < ActiveRecord::Base
  belongs_to :school
  has_many :groups, :dependent => :destroy

  attr_accessible :name, :key, :units

  validates :name, :uniqueness => true, :presence => true
  validates :key, :units, :presence => true
  validates :units, :numericality => true
end
