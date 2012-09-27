class PanelsController < ApplicationController
	  def index
	   	@most_mangas =  Manga.desc(:views).limit(15)
	   	@lasts = Manga.desc(:create_date).limit(8)
	   	@slide = Slide.asc(:title)
	   	@chapter = Chapter.asc(:id).limit(20)
	   	@manga = Manga.all
	  end
	def new
		@manga = Manga.new
	end 
	def show
		@manga = Manga.find(params[:id])
		@total_views = Chapter.where(manga_id: @manga._id).sum(:views)
		Manga.where(_id: @manga._id).update(views: @total_views)
	end
	def create
		@manga = Manga.new(params[:manga])
		if @manga.save
		  flash[:success] = "Create success"
		  redirect_to @manga
		else
		  render 'new'
		end
	end

	def edit
		@manga = Manga.find(params[:id])
	end

	def update
		@manga = Manga.find(params[:id])
		if @manga.update_attributes(params[:manga])
		  flash[:success] = "Profile updated"
		  redirect_to @manga
		else
		  render 'edit'
		end
	end

	def destroy
	    @manga = Manga.find(params[:id]).destroy
	    flash[:success] = "manga destroyed."
	    redirect_to :action => :index
	end
end
