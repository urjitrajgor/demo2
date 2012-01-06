class UsersController < ApplicationController

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
#
#    file_param = params[:image]
#  file_name = file_param.original_filename
#
#  file_data = File.read(file_param.tempfile)
#
#  File.open File.join('photos', file_name), 'w' do |f|
#    f.write(file_data)
  

#    pic = params[:user][:image]
#    @user.image = pic.original_filename
#    FileUtils.copy(pic.local_path)
    ##    @user.image_full=params[:user][:image].read
    #    @user.image_full_mime=params[:user][:image].content_type()
    respond_to do |format|
      if @user.save
        flash[:notice] = "Successfully created..."
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }

      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  def login
    @message = "Enter your login password"
  end

  def sign_in
    
    @user = User.find_by_name_and_password(params[:login][:name],params[:login][:password])
    if @user.nil?
      @message = "login password does not match"
      render :action => 'login'
    else
      redirect_to deshboard_path(@user)
    end
  end


end