class PicsController < ApplicationController
  before_action :set_pic, only: [:edit, :show, :update, :destroy]
  def index 
    @pics = Pic.all.order('created_at DESC')
  end

  def new
    @pic = current_user.pics.build
  end

  def create
    @pic = current_user.pics.build(pic_params)
    if @pic.save
      redirect_to @pic, notice: 'Pic was successfully created.'
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @pic.update(pic_params)
      redirect_to @pic, notice: 'Pic was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    if @pic.destroy
      redirect_to root_path, alert: 'Pic was successfully deleted.'
    end
  end

  private
  def pic_params
    params.require(:pic).permit(:title, :description, :image)
  end

  def set_pic
    @pic = Pic.find(params[:id])
  end
end
