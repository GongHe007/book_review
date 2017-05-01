class Api::BooksController < ApiController
  def index
    if params[:content].present?
      content = params[:content].gsub(" ", "")
      @search_books = Book.where("name like ?", "%#{content}%")
    end
    @time_books = Book.order("created_at desc").limit(12)
    @review_books = Book.order("book_reviews_count desc, created_at desc").limit(12)
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