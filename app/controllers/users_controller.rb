class UsersController < ApplicationController
  def index
    @users = User.all.to_a
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: "Created a new user" and return
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to root_path, notice: "Updated #{@user.first_name} #{@user.last_name}" and return
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path, notice: "#{@user.first_name} #{@user.last_name} deleted" and return
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
