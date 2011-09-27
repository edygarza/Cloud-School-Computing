
class School < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  has_many :users, :dependent => :destroy
  has_many :students, :dependent => :destroy

  attr_accessible :owner_id, :name, :description, :address, :telephone
end
