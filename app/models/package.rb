class Package < ActiveRecord::Base
  has_many :users

  attr_accessible :name, :users_limit, :students_limit, :groups_limit, :subjects_limit

  validates_presence_of :name
  validates :users_limit, :students_limit, :groups_limit, :subjects_limit, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 },
		 :allow_blank => false
end
