ActiveAdmin.register AdminUser do
  permit_params :email, :password
  menu label: "管理员", priority: 100
  filter :name
  form do |f|
    f.semantic_errors *f.object.errors.keys

    inputs '基本信息' do
      input :email
      input :password
    end

    actions
  end

end
