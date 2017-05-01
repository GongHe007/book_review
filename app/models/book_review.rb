class BookReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :book, counter_cache: true
  has_many :replies
end