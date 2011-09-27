require 'test_helper'

class SchoolTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert School.new.valid?
  end
end
