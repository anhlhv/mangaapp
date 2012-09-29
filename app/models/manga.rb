class Manga
  include Mongoid::Document
  include Mongoid::FullTextSearch
  # include Mongoid::TimeStamps

  paginates_per 20

  field :name
  field :released
  field :type
  field :thumb
  field :views, type: Integer, default: 0
  field :description
  field :cover_photo_url
  field :photo_album_name
  field :author

  has_many :chapters

  fulltext_search_in :name, :author
end
