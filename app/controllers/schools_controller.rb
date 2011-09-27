class SchoolsController < ApplicationController
  load_and_authorize_resource

  def index
    @schools = School.accessible_by(current_ability)
  end

  def show
    @school = School.find(params[:id])
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(params[:school])
    @school.owner = current_user

    if @school.save
      redirect_to @school, :notice => "Successfully created school."
    else
      render :action => 'new'
    end
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    if @school.update_attributes(params[:school])
      redirect_to @school, :notice  => "Successfully updated school."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @school = School.find(params[:id])
    @school.destroy
    redirect_to schools_url, :notice => "Successfully destroyed school."
  end
end
