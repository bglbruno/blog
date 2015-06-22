class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :title, type: String
  field :preview, type: String
  field :content, type: String
  
  slug :title

  has_many :comments

  validates_presence_of :title, :preview, :content
  validates_length_of :preview, maximum: 50
  validates_length_of :content, minimum: 15
  
  default_scope -> { order_by(created_at: :desc) }
end
