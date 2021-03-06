class SubjectsController < ApplicationController
  def index
    @school = School.find(params[:school_id])
    query = "key LIKE ? OR name LIKE ?"
    @subjects = @school.subjects.where(query, "%#{params[:q]}%", "%#{params[:q]}%")
    @subjects = @subjects.page().per(10)
  end

  def more
    @school = School.find(params[:school_id])
    query = "key LIKE ? OR name LIKE ?"
    @subjects = @school.subjects.where(query, "%#{params[:q]}%", "%#{params[:q]}%")
    @subjects = @subjects.page(params[:page_id]).per(10)

    render :layout => false
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(params[:subject])
    @subject.school = School.find(params[:school_id])
    if @subject.save
      redirect_to school_subject_path(@subject.school,@subject), :notice => "Successfully created subject."
    else
      render :action => 'new'
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(params[:subject])
      redirect_to school_subject_path(@subject.school,@subject), :notice  => "Successfully updated subject."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    redirect_to school_subjects_path(@subject.school), :notice => "Successfully destroyed subject."
  end
end
