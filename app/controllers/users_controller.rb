class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :ensure_user, only: %i[ edit update destroy ]

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: "プロフィールを編集しました"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_path
  end
  
  private

  def ensure_user
    @users = current_user.id
    redirect_to new_session_path if @user.id != @users
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:image, :image_cache, :name, :email,
                                  :password, :password_confirmation)
  end
  
end
