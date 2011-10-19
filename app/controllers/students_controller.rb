class StudentsController < ApplicationController
  load_and_authorize_resource :school
  load_and_authorize_resource :user, :through => :school

  def index
    @school = School.find(params[:school_id])
    query = "registration_number LIKE ? OR first_name LIKE ? OR last_name LIKE ? OR tutor LIKE ?"
    @students = @school.students.where(query, "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    @students = @students.page().per(10)
  end

  def more
    @school = School.find(params[:school_id])
    query = "registration_number LIKE ? OR first_name LIKE ? OR last_name LIKE ? OR tutor LIKE ?"
    @students = @school.students.where(query, "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    @students = @students.page(params[:page_id]).per(10)
  
    render :layout => false
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
    @school = School.find(params[:school_id])
  end

  def create
    @student = Student.new(params[:student])
    @student.school = School.find(params[:school_id])

    if @student.save
      redirect_to school_student_path(@student.school,@student), :notice => "Successfully created student."
    else
      render :action => 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
    @school = School.find(params[:school_id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(params[:student])
      redirect_to school_student_path(@student.school,@student), :notice  => "Successfully updated student."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to school_students_path, :notice => "Successfully destroyed student."
  end
end
