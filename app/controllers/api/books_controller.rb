class Api::BooksController < ApiController
  def index
    if params[:content].present?
      content = params[:content].gsub(" ", "")
      @search_books = Book.where("name like ?", "%#{content}%")
    end
    @time_books = Book.order("updated_at desc").limit(12)
    @review_books = Book.order("book_reviews_count desc").limit(12)
  end

  def show
    @book = Book.find(params[:id])
    @book_reviews = @book.book_reviews.order("replies_count desc")
  end

  def real_index
    if params[:order] == "hot"
      @books = Book.order("book_reviews_count desc")
    else
      @books = Book.order("updated_at desc")
    end
  end
end