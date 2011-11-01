class Activity < ActiveRecord::Base
  belongs_to :group

  attr_accessible :group_id, :title, :value
end
