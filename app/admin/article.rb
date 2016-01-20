ActiveAdmin.register Article do
  menu priority: 50
  permit_params :category, :section, :title, :description, :body, :author, :written_on

  controller do
    def scoped_collection
      super.where(language: I18n.locale)
    end
  end

  index do
    selectable_column
    id_column
    column :category
    column :section
    column :title
    column :written_on
    actions
  end

  filter :id
  filter :category
  filter :section
  filter :title
  filter :written_on

  form do |f|
    semantic_errors
    inputs do
      input :category
      input :section
      input :title
      input :description, input_html: { rows: 2 }
      input :body, as: :ckeditor, input_html: { ckeditor: { language: I18n.locale,
        uiColor: '#6EA1DC', height: 600 } }, label: false
      input :author
      input :written_on
    end
    actions
  end

  show do
    attributes_table do
      row :category
      row :section
      row :title
      row :description
      row('Body') { |a| a.body.html_safe }
      row :author
      row :written_on
    end
    active_admin_comments
  end
end
