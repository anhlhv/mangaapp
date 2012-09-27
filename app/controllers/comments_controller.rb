require 'open-uri'
class CommentsController < ApplicationController
    def create
        @manga1 = Manga.find(params[:manga_id])
        @manga = @manga1.comments.create(params[:comment])
        @manga.user_id = current_user.id
        @manga.created_at = Time.now
        @manga.save
        redirect_to @manga1
    end
    def index
        @comments = Comment.asc(:created_at)
    end
end
