class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :content, type: String
  
  has_many :comments

  validates_presence_of :title, :content
  validates_length_of :content, minimum: 15
  
  default_scope -> { order_by(created_at: :desc) }
end
