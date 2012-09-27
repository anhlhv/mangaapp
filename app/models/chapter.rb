class Chapter
  include Mongoid::Document
  field :content, type: String
  field :name
  field :cover_photo_url
  field :photo_album_id
  field :photo_album_name
  field :views, type: Integer, default: 0
  field :index
  field :picasa_id
  field :image_urls, type: Array, default: []
  field :create_date, default: Time.new(2012,9,1,15,25,0, "+09:00")
  belongs_to :manga
end
