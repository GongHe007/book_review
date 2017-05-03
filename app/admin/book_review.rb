ActiveAdmin.register BookReview do
  permit_params :user_id, :book_id, :title, :content, :online
  menu label: "书评", priority: 100
  index :download_links => false do
    # whatever
  end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
