class GroupsController < ApplicationController
  load_and_authorize_resource

  def index
    if !params[:school_id].nil?
      @groups = Group.where(:school_id => params[:school_id])
    else
      @groups = Group.all
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
    if !params[:school_id].nil?
      @school = School.find(params[:school_id])
    end
  end

  def create
    @group = Group.new(params[:group])
    if !params[:school_id].nil?
      school = School.find(params[:school_id])
      @group.school = school
    end

    if @group.save
      if params[:school_id].nil?
        redirect_to root_url, :notice => "Signed Up!"
      else
	redirect_to school_groups_path, :notice => "Added Group!"
      end      
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(params[:group])
      redirect_to school_group_path(@group.school), :notice  => "Successfully updated group."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to school_groups_path(@group.school), :notice => "Successfully destroyed group."
  end
end
