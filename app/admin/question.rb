ActiveAdmin.register Question do
  permit_params :category_id, :text

  show do
    attributes_table do
      row :id
      row :category
      row :text
    end
  end

  form do |f|
    f.inputs "Event", :multipart => true do
      f.input :category
      f.input :text
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit question: [:category_id, :text]
    end
  end
end
