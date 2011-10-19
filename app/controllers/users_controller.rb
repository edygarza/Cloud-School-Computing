class UsersController < ApplicationController
  load_and_authorize_resource :school, :except => [:new, :create]
  load_and_authorize_resource :user, :through => :school, :except => [:new, :create]

  def index
    @school = School.find(params[:school_id])
    query = "username LIKE ? OR first_name LIKE ? OR last_name LIKE ? OR email LIKE ?"
    if params[:type].nil? || params[:type].blank?
      @users = @school.users.where(query, "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    else
      if params[:type] == "0"
    	query = "(" + query + ") AND teacher = 't'"    
      else
        query = "(" + query + ") AND assistant = 't'"
      end
      @users = @school.users.where(query, "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%") 
    end
    @users = @users.page().per(10)
  end

  def more
    @school = School.find(params[:school_id])
    query = "username LIKE ? OR first_name LIKE ? OR last_name LIKE ? OR email LIKE ?"
    if params[:type].nil? || params[:type].blank?
      @users = @school.users.where(query, "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    else
      if params[:type] == "0"
        query = "(" + query + ") AND teacher = 't'"
      else 
        query = "(" + query + ") AND assistant = 't'" 
      end
      @users = @school.users.where(query, "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    end
    @users = @users.page(params[:page_id]).per(10)

    render :layout => false
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    if !params[:school_id].nil?
      @school = School.find(params[:school_id])
    end
  end

  def create
    @user = User.new(params[:user])
    if !params[:school_id].nil?
      school = School.find(params[:school_id])
      @user.school = school
    end

    if @user.save
      if params[:school_id].nil?
        redirect_to root_url, :notice => "Signed Up!"
      else
	redirect_to school_users_path, :notice => "Added User!"
      end
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to school_user_path(@user.school), :notice  => "Successfully updated user."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    school = @user.school
    @user.destroy
    redirect_to school_users_path, :notice => "Successfully destroyed user."
  end

  def teachers
    @school = School.find(params[:school_id])
    @users = @school.users.where(:teacher => true)
  end
end
