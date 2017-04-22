class Api::BookReviewsController < ApiController
  def new
    @book_review = BookReview.new
  end

  def create
    binding.pry
  end
end