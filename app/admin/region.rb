ActiveAdmin.register Region do
  menu priority: 20
  config.sort_order = 'id_asc'
  config.filters = false

  permit_params :slug, :name_uk, :name_ru, :name_en, :latitude, :longitude

  index do
    selectable_column
    column :name

    actions
  end

  show do
    attributes_table do
      row :slug
      row :name_uk
      row :name_ru
      row :name_en
      row :latitude
      row :longitude
    end
    active_admin_comments
  end
end
