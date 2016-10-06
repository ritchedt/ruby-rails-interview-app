class UsersController < ApplicationController

  def index
    remove_duplicate_users
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:notice] = "#{@user.name.capitalize} has been created!"
    else
      flash.now[:warning] = "No user has been created!"
    end
    render 'new'
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash.now[:notice] = "The user has been updated to #{@user.name}!"
    else
      flash.now[:warning] = "The user info has not been updated!"
    end
    render 'edit'
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash.now[:notice] = "#{user.name} was removed."
  end

  def new
    @user = User.new
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end

    def remove_duplicate_users
      duplicate_row_values = User.select('name').group('name').having('count(*) > 1').pluck(:name)

      duplicate_row_values.each do |name|
        User.where(name: name).order(id: :asc)[1..-1].map(&:destroy)
      end
    end
end
