class Comment
  include Mongoid::Document
  field :user_id
  field :comment
  field :created_at
  belongs_to :manga
end
