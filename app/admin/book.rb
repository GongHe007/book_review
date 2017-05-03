ActiveAdmin.register Book do
  permit_params :name, :author, :description, :img, :online, :book_type
  menu label: "图书", priority: 100
  index :download_links => false do
    # whatever
  end
end
