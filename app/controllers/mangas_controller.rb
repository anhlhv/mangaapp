class MangasController < ApplicationController
	  def index
	   	@most_mangas =  Manga.desc(:views).limit(15)
	   	@last_mangas = Manga.desc(:create_date).limit(10)
	   	# @slide = Slide.asc(:title)
	   	@chapter = Chapter.asc(:id).limit(30)
	   	@manga_week = Manga.first
	  end
	def new
		@manga = Manga.new
	end 
	def show
		@manga = Manga.find(params[:id])
		@chapters= @manga.chapters.desc(:index).page(params[:page]).per(20);
		@total_views = Chapter.where(manga_id: @manga._id).sum(:views)
		Manga.where(_id: @manga._id).update(views: @total_views)
	end
	def create
		@manga = Manga.new(params[:manga])
		@manga.create_date = Time.now
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
	def search
		@last_mangas = Manga.desc(:updated_at).limit(20)
		@results = Manga.fulltext_search(params[:keyword])
	end
	def list
	  	if params[:sort].nil?
	  		sort = "name"
	  	else
	  		sort = params[:sort]
	  	end
	   	@Lists = Manga.any_of({ :name => /^#{params[:like]}.*/ }).asc(sort).page(params[:page]).per(20) ;
	end
	def destroy
	    @manga = Manga.find(params[:id]).destroy
	    flash[:success] = "manga destroyed."
	    redirect_to :action => :index
	end
end
