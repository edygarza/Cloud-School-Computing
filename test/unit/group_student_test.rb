require 'test_helper'

class GroupStudentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert GroupStudent.new.valid?
  end
end
