require 'open-uri'
class ChaptersController < ApplicationController
  def home
  end
  def index
    @chapters = Chapter.asc(:content).page params[:page]
    @mangas = Manga.asc(:name).page params[:page]
  end
  def create
    @manga1 = Manga.find(params[:manga_id])
    @manga = @manga1.chapters.create(params[:chapter])
    @manga.save
    redirect_to @manga1
  end
  def new
    @chapter = Chapter.new
  end 
  def show
    @chapter = Chapter.find(params[:id])
    @list_chapter = Chapter.where(manga_id: @chapter.manga_id)
    @list_chapter.update(views: @chapter.views+1)
    @list_index = @list_chapter.asc(:index)
    base_url = "http://picasaweb.google.com/data/feed/api/user/"
    userId = @chapter.picasa_id
    format = "?alt=json"
    album_path = "/albumid/"
    unless @chapter.photo_album_id.blank?
      album_id = @chapter.photo_album_id.to_s
      url = URI.encode(base_url+userId+album_path+album_id+format)
      buffer = open(url).read
      @album = JSON.parse(buffer)
    end
  end
    def edit
    @chapter = Chapter.find(params[:id])
  end
  def update
    @chapter = Chapter.find(params[:id])
    if @chapter.update_attributes(params[:chapter])
      flash[:success] = "Profile updated"
      redirect_to @chapter
    else
      render 'edit'
    end
  end
  def help
  end
  def destroy
      @chapter = Chapter.find(params[:id])
      @manga= @chapter.manga
      @chapter.delete
      flash[:success] = "manga destroyed."
      redirect_to @manga
  end
end
