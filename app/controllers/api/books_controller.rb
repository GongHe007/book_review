class Api::BooksController < ApiController
  def index
    if params[:content].present?
      content = params[:content].gsub(" ", "")
      @search_books = Book.where("name like ?", "%#{content}%")
    end
    @time_books = Book.order("updated_at desc").limit(12)
    @review_books = Book.order("book.book_reviews desc")
  end

  def show
    @book = Book.find(params[:id])
    @book_reviews = @book.book_reviews
  end
end