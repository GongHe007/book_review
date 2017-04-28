ActiveAdmin.register Book do
  permit_params :name, :author, :description, :img, :online
  menu label: "图书", priority: 100
end
