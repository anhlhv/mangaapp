module MangasHelper
	def user_comment(comment_id)
		return User.where(id:comment_id).last
	end
	def manga_name(manga_id)
		return Manga.where(_id:manga_id).first.name
	end
end
