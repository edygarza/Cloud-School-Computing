require 'test_helper'

class TeachersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Teacher.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Teacher.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Teacher.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to teacher_url(assigns(:teacher))
  end

  def test_edit
    get :edit, :id => Teacher.first
    assert_template 'edit'
  end

  def test_update_invalid
    Teacher.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Teacher.first
    assert_template 'edit'
  end

  def test_update_valid
    Teacher.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Teacher.first
    assert_redirected_to teacher_url(assigns(:teacher))
  end

  def test_destroy
    teacher = Teacher.first
    delete :destroy, :id => teacher
    assert_redirected_to teachers_url
    assert !Teacher.exists?(teacher.id)
  end
end
