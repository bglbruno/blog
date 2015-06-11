class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :author, type: String
  field :message, type: String

  belongs_to  :post

  validates_uniqueness_of :author, :message
end
