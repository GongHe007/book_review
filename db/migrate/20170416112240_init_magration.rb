class InitMagration < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :nikename, null: false
      t.string :password, null: false

      t.timestamps
    end

    create_table :books do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.boolean :online, null: false, defult: true

      t.timestamps
    end

    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :book_id, null: false
      t.string :title, null: false
      t.text :content, nill: false
      t.boolean :online, null: false, defult: true

      t.timestamps
    end

    create_table :reply_comments do |t|
      t.integer :comment_id, null: false
      t.text :content, null: false
      t.boolean :online, null: false, defult: true

      t.timestamps
    end

  end
end
