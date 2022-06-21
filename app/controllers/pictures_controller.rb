class PicturesController < ApplicationController
  before_action :set_picture, only: %i[ show edit update destroy ]

  def index
    @pictures = Picture.all.order("id DESC")
  end

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    render :new and return if params[:back]
    if @picture.save
      redirect_to pictures_path, notice: "Posting completed."
    else
      render :new
    end
  end
  
  def show
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

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:content, :image, :image_cache)
  end
end
