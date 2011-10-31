require 'test_helper'

class GroupsStudentsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert GroupsStudents.new.valid?
  end
end
