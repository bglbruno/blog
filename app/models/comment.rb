class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :author, type: String
  field :message, type: String

  belongs_to  :post
  
  validates_presence_of :author, :message

  default_scope -> { order_by(created_at: :asc) }
end
