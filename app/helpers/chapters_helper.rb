module ChaptersHelper
	def chapter_index(index)
		return @list_chapter.where(index:index).last.id
	end
end

