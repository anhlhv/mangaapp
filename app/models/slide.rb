class Slide
  include Mongoid::Document
  field :title
  field :slide_url
  field :photo_url
  field :order
end
