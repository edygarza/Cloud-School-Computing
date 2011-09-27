
class School < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  has_many :teachers, :dependent => :destroy
  has_many :users, :dependent => :destroy

  attr_accessible :owner_id, :name, :description, :address, :telephone
end
