class TeachersController < ApplicationController
  load_and_authorize_resource :school
  load_and_authorize_resource :teacher, :through => :school

  def index
    @school = School.find(params[:school_id])
    @teachers = @school.teachers
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def new
    @teacher = Teacher.new
    @teacher.school = School.find(params[:school_id])

    User.find_by_school(@teacher.school)
  end

  def create
    @teacher = Teacher.new(params[:teacher])
    @teacher.school = School.find(params[:school_id])

    if @teacher.save
      redirect_to school_teachers_path(@teacher.school), :notice => "Successfully created teacher."
    else
      render :action => 'new'
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update_attributes(params[:teacher])
      redirect_to school_teachers_path(@teacher.school), :notice  => "Successfully updated teacher."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
    redirect_to school_teachers_path(@teacher.school), :notice => "Successfully destroyed teacher."
  end
end
