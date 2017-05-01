class AddBookReviewsCountToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :book_reviews_count, :integer, default: 0
  end
end
