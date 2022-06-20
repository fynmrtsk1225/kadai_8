class PicturesController < ApplicationController
  def index
    @pictures = Picture.all.order("id DESC")
  end

  def new
  end

  def confirm
  end

  def show
  end

  def edit
  end
end
