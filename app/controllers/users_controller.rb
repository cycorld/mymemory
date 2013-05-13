class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :root
  end


  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @new_user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @new_user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    user = User.new(params[:new_user])
    user.username = params[:user][:username]
    user.student_id = params[:user][:student_id]
    user.department_id = params[:user][:department_id]
    user.password = params[:user][:password]
    user.activated = true
    if user.save
      redirect_to :root
    else
      render :text => "ERROR"
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end


  def current_user
    @_current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
  end

  def login
    user = User.find_by_username(params[:username])
    if user.password_hash == Digest::SHA1.hexdigest(params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.username
      redirect_to :root
    else
      redirect_to :root
    end
  end



end
