class Panel
  include Mongoid::Document
  field :sitename
  field :title
  field :description
  field :author
  field :keyword
  field :notification
end
