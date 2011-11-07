class GradesController < ApplicationController
  def index
    
  end

  def show
    @grade = Grade.find(params[:id])
  end

  def new
    @grade = Grade.new
  end

  def create
    @school = params[:school_id]
    @group = params[:group_id]
    @activity = params[:activity_id]
    @group_students = GroupStudent.where(:group_id => @group)
    @group_students.each do |group_student|        
        @grade = Grade.where(:student_id => group_student.student_id, :activity_id =>@activity).first
	if(@grade.nil?)	
	  @grade = Grade.new
	end	
	@grade.grade = params["grade_#{group_student.student_id}"]
        @grade.student_id = group_student.student_id
        @grade.activity_id = @activity
	if !@grade.save
          redirect_to school_group_activity_grades_path
        end
    end
    redirect_to school_group_activity_grades_path, :notice => "Successfully created grade."
  end

  def edit
    @grade = Grade.find(params[:id])
  end

  def update
    @grade = Grade.find(params[:id])
    if @grade.update_attributes(params[:grade])
      redirect_to @grade, :notice  => "Successfully updated grade."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @grade = Grade.find(params[:id])
    @grade.destroy
    redirect_to grades_url, :notice => "Successfully destroyed grade."
  end
end
