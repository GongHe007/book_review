class Api::BooksController < ApiController
  def index
    if params[:book_type]
      @books = Book.where(book_type: params[:book_type])
    else
      if params[:content].present?
        content = params[:content].gsub(" ", "")
        @search_books = Book.where("name like ?", "%#{content}%")
      end
      @time_books = Book.order("created_at desc").limit(12)
      @review_books = Book.order("book_reviews_count desc, created_at desc").limit(12)
      @book_reviews = BookReview.where("title is not null").order("replies_count desc").limit(3)
    end
  end

  def show
    @book = Book.find(params[:id])
    @book_reviews = @book.book_reviews.order("replies_count desc, created_at").limit(4)
  end

  def real_index
    if params[:order] == "hot"
      @books = Book.order("book_reviews_count desc, created_at desc")
    else
      @books = Book.order("created_at desc")
    end
  end
end