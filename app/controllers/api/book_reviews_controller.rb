class Api::BookReviewsController < ApiController
  def index
    @book_reviews = BookReview.order("replies_count desc, created_at desc")
  end

  def new
    @book_review = BookReview.new(book_id: params[:book_id])
  end

  def create
    book_review_params = params.require(:book_review).permit(:title, :content, :book_id).merge({user_id: current_user_id, online: true})
    book_review = BookReview.new(book_review_params)
    if book_review.save
      redirect_to api_book_path(book_review.book)
    else
      @notice = "未知错误"
      render :new
    end
  end

  def show
    @book_review = BookReview.find(params[:id])
    @replies = @book_review.replies
  end
end