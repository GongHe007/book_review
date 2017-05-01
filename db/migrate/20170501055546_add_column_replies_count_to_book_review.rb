class AddColumnRepliesCountToBookReview < ActiveRecord::Migration[5.0]
  def change
    add_column :book_reviews, :replies_count, :integer, default: 0
  end
end
