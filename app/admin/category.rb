ActiveAdmin.register Category do
  active_admin_import
  permit_params :title, :color

end
