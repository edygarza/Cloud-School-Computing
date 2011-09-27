require 'test_helper'

class SchoolTeacherTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert SchoolTeacher.new.valid?
  end
end
