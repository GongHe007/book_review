class Api::BooksController < ApiController
  def index
    @books = Book.order("updated_at desc")
  end

  def show
    @book = Book.find(params[:id])
    @book_reviews = @book.book_reviews
  end
end