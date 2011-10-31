require 'test_helper'

class GroupStudentsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => GroupStudent.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    GroupStudent.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    GroupStudent.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to group_student_url(assigns(:group_student))
  end

  def test_edit
    get :edit, :id => GroupStudent.first
    assert_template 'edit'
  end

  def test_update_invalid
    GroupStudent.any_instance.stubs(:valid?).returns(false)
    put :update, :id => GroupStudent.first
    assert_template 'edit'
  end

  def test_update_valid
    GroupStudent.any_instance.stubs(:valid?).returns(true)
    put :update, :id => GroupStudent.first
    assert_redirected_to group_student_url(assigns(:group_student))
  end

  def test_destroy
    group_student = GroupStudent.first
    delete :destroy, :id => group_student
    assert_redirected_to group_students_url
    assert !GroupStudent.exists?(group_student.id)
  end
end
