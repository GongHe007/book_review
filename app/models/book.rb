class Book < ActiveRecord::Base
  has_many :book_reviews
  validates :name, presence: true, allow_blank: false
  validates :author, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :img, presence: true, allow_blank: false
  validates :book_type, presence: true, allow_blank: false
end