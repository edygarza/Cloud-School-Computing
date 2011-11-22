class UsersController < ApplicationController
  load_and_authorize_resource :user, :only => [:admin_index, :admin_show, :admin_edit, :admin_update, :admin_destroy]
  load_and_authorize_resource :school, :except => [:new, :create, :admin_index, :admin_show, :admin_edit, :admin_update, :admin_destroy]
  load_and_authorize_resource :user, :through => :school, :except => [:new, :create, :admin_index, :admin_show, :admin_edit, :admin_update, :admin_destroy]	

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
    params[:user].delete("password_confirmation")
    @user = User.new(params[:user])
    if !params[:school_id].nil?
      @school = School.find(params[:school_id])
      @user.school = @school
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
    if params[:school_id]
      @school = School.find(params[:school_id])
    end

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

  def admin_index
    query = "(director = 't' OR school_id IS NULL) AND (username LIKE ? OR first_name LIKE ? OR last_name LIKE ? OR email LIKE ?)"
    @users = User.where(query, "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    @users = @users.page().per(10)
  end

  def admin_update
    @user = User.find(params[:id])
    pass = @user.crypted_password

    if @user.update_attributes(params[:user])
      @user.crypted_password = pass
      @user.save
      redirect_to users_path, :notice  => "Successfully updated user."
    else
      render :action => 'admin_edit'
    end
  end

  def admin_destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, :notice => "Successfully destroyed user."
  end
end
