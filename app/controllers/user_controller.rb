class UserController < ApplicationController
  before_filter :authorize_user!

  def index
    @users = User.all

    respond_to do |format|
      format.html

    end
  end

  def show
    @user = User.find(params[:id])
  
    respond_to do |format|
      format.html
    end
  end

  def new
    @user = User.new
    @user.build_user

    respond_to do |format|
      format.html
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
  
    respond_to do |format|
      format.html
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:users])
        format.html {redirect_to(@user, :notice => 'User was successfully updated.')}
      else
        format.html {render :action => "edit" }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html {redirect_to(users_url) }
    end
  end
end
