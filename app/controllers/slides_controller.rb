require 'open-uri'
class SlidesController < ApplicationController
  def index
      @slides = Slide.asc(:order)
  end
  def new
    @slide = Slide.new
  end 
  def create
    @slide = Slide.new(params[:slide])
    if @slide.save
      flash[:success] = "Create success"
      redirect_to slides_path
    else
      render 'new'
    end
  end
  def show
    @slide = Slide.find(params[:id])
  end
  def edit
    @slide = Slide.find(params[:id])
  end
    def update
    @slide = Slide.find(params[:id])
    if @slide.update_attributes(params[:slide])
      flash[:success] = "Profile updated"
      redirect_to @slide
    else
      render 'edit'
    end
  end
  def destroy
      @slide = Slide.find(params[:id]).destroy
      flash[:success] = "slide destroyed."
      redirect_to slides_path
  end
end
