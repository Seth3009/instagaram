class PicsController < ApplicationController
  before_action :set_pic, only: [:edit, :show, :update, :destroy]
  def index 
  end

  def new
    @pic = Pic.new
  end

  def create
    @pic = Pic.new(pic_params)
  end

  private
  def pic_params
    params.require(:pic).permit(:title, :description)
  end

  def set_pic
    @pic = Pic.find(params[:id])
  end
end
