class User < ActiveRecord::Base
  validates :username, presence: true
  has_many :book_reviews
end