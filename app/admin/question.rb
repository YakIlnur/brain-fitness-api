ActiveAdmin.register Question do
  permit_params :category_id, :text, answer_variants_attributes: [:id, :text, :value, _destroy: true]

  show do |question|
    attributes_table do
      row :id
      row :category
      row :text
      question.answer_variants.each do |var|
        row :answer do
          var.text
        end
      end
    end
  end

  form do |f|
    f.inputs 'Question' do
      f.input :category
      f.input :text
      f.has_many :answer_variants, heading: 'Answer variants', allow_destroy: false, new_record: true do |a|
        a.input :text
        a.input :value, label: 'Right'
      end
    end
    f.actions
  end
end
