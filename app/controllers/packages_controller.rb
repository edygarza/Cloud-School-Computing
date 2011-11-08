class PackagesController < ApplicationController
  load_and_authorize_resource

  def index
    @packages = Package.all
  end

  def show
    @package = Package.find(params[:id])
  end

  def new
    @package = Package.new
  end

  def create
    @package = Package.new(params[:package])
    if @package.save
      redirect_to @package, :notice => "Successfully created package."
    else
      render :action => 'new'
    end
  end

  def edit
    @package = Package.find(params[:id])
  end

  def update
    @package = Package.find(params[:id])
    if @package.update_attributes(params[:package])
      redirect_to @package, :notice  => "Successfully updated package."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @package = Package.find(params[:id])
    @package.destroy
    redirect_to packages_url, :notice => "Successfully destroyed package."
  end
end
