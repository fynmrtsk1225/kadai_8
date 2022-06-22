class PicturesController < ApplicationController
  before_action :ensure_user, only: %i[ edit update destroy ]
  before_action :set_picture, only: %i[ show edit update destroy ]

  def index
    @pictures = Picture.all.order("id DESC")
  end

  def new
    render :index and return if params[:back]
    @picture = Picture.new
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    render :new and return if params[:back]
    if @picture.save
      PostedMailer.posted_mail(@picture).deliver
      redirect_to pictures_path, notice: "Posting completed."
    else
      render :new
    end
  end
  
  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
  end

  def update
    render :new and return if params[:back]
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "Editing completed"
    else
      render :edit
    end
  end
  

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "Deletion completed"
  end
  

  private

  def ensure_user
    @pictures = current_user.pictures
    @picture = @pictures.find_by(id: params[:id])
    redirect_to new_session_path, notice: "Login required" unless @picture
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:content, :image, :image_cache)
  end
end
