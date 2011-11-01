class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
    @group = Group.find(params[:group_id])
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
    @group = Group.find(params[:group_id])
  end

  def create
    @activity = Activity.new(params[:activity])
    @group = Group.find(params[:group_id])
    @activity.group = @group

    if @activity.save
      redirect_to school_group_activities_url, :notice => "Se ha agregado actividad satisfactoriamente."
    else
      render :action => 'new'
    end
  end

  def edit
    @activity = Activity.find(params[:id])
    @group = Group.find(params[:group_id])
  end

  def update
    @activity = Activity.find(params[:id])

    if @activity.update_attributes(params[:activity])
      redirect_to school_group_activities_url, :notice  => "Se ha actualizado la actividad satisfactoriamente."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to school_group_activities_url, :notice => "Se ha destruido la actividad satisfactoriamente."
  end
end
