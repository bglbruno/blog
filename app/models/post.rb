class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :title, type: String
  field :content, type: String
  
  slug :title

  has_many :comments

  validates_presence_of :title, :content
  validates_length_of :content, minimum: 15
  
  default_scope -> { order_by(created_at: :desc) }
end
