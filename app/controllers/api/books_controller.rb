class Api::BooksController < ApiController
  def index
    if params[:content].present?
      content = params[:content].gsub(" ", "")
      @search_books = Book.where("name like ?", "%#{content}%")
    end
    @time_books = Book.order("updated_at desc").limit(12)
    @review_books = Book.all.sort_by{|x| [x.book_reviews_count, x.updated_at]}[0..11]
  end

  def show
    @book = Book.find(params[:id])
    @book_reviews = @book.book_reviews.sort_by {|x| [x.replies_count, x.updated_at] }
  end

  def real_index
    if params[:order] == "hot"
      @books = Book.all.sort_by{|x| [x.book_reviews_count, x.updated_at]}
    else
      @books = Book.order("updated_at desc")
    end
  end
end