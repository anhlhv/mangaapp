class Chapter
  include Mongoid::Document
  include Mongoid::Timestamps::Updated
  field :content, type: String
  field :name
  field :cover_photo_url
  field :photo_album_id
  field :photo_album_name
  field :views, type: Integer, default: 0
  field :index
  field :picasa_id
  field :image_urls, type: Array, default: []
  belongs_to :manga
end
