require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Subject.new.valid?
  end
end
