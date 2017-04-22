class AddColumnAuthorToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :author, :string, null: false
    add_column :books, :img, :string, null: false
  end
end
