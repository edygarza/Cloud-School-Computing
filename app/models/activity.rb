class Activity < ActiveRecord::Base
  belongs_to :group

  attr_accessible :group_id, :title, :value

  validates :value, :allow_nil => false, :allow_blank => false, :numericality => true
end
