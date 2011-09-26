class TeachersController < ApplicationController
  # GET /teachers
  # GET /teachers.json
  def index
    @user = User.find(params[:user_id])
    @teachers = @user.teachers.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @teachers }
    end
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @teacher }
    end
  end

  # GET /teachers/new
  # GET /teachers/new.json
  def new
    @user = User.find(params[:user_id])
    @teacher = Teacher.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @teacher }
    end
  end

  # GET /teachers/1/edit
  def edit
    @teacher = Teacher.find(params[:id])
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(params[:teacher])
    @teacher.user = User.find(params[:user_id])

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to user_teachers_path, :notice => 'Teacher was successfully created.' }
        format.json { render :json => @teacher, :status => :created, :location => @teacher }
      else
        format.html { render :action => "new" }
        format.json { render :json => @teacher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /teachers/1
  # PUT /teachers/1.json
  def update
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      if @teacher.update_attributes(params[:teacher])
        format.html { redirect_to user_teachers_path, :notice => 'Teacher was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @teacher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to user_teachers_path }
      format.json { head :ok }
    end
  end
end
