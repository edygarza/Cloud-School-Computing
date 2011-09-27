require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Teacher.new.valid?
  end
end
