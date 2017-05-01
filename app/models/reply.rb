class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :book_review, counter_cache: true
end