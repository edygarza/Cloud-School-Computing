class GroupStudentsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @group_students = GroupStudent.find(:all, :conditions => { :group_id => @group.id } )
  end

  def new
    @group_student = GroupStudent.new
    @group = Group.find(params[:group_id])
  end

  def create
    @group_student = GroupStudent.new
    @group = Group.find(params[:group_id])
    @group_student.group = @group
    @group_student.student = @group.school.students.where("registration_number = ?", "#{params[:group_student]['student_id']}").first

    if !@group_student.student.nil? && @group_student.save
      redirect_to school_group_group_students_url, :notice => "Se ha agregado alumno al grupo satisfactoriamente."
    else
      flash[:error] = "Numero de Matricula no existe"
      render :action => 'new'
    end
  end

  def edit
    @group_student = GroupStudent.find(params[:id])
  end

  def destroy
    @group_student = GroupStudent.find(params[:id])
    @group_student.destroy
    redirect_to school_group_group_students_url, :notice => "Se ha eliminado el estudiante del grupo satisfactoriamente."
  end
end
