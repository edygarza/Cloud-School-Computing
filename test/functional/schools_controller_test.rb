require 'test_helper'

class SchoolsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => School.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    School.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    School.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to school_url(assigns(:school))
  end

  def test_edit
    get :edit, :id => School.first
    assert_template 'edit'
  end

  def test_update_invalid
    School.any_instance.stubs(:valid?).returns(false)
    put :update, :id => School.first
    assert_template 'edit'
  end

  def test_update_valid
    School.any_instance.stubs(:valid?).returns(true)
    put :update, :id => School.first
    assert_redirected_to school_url(assigns(:school))
  end

  def test_destroy
    school = School.first
    delete :destroy, :id => school
    assert_redirected_to schools_url
    assert !School.exists?(school.id)
  end
end
