ActiveAdmin.register District do
  menu priority: 30
  config.sort_order = 'id_asc'

  permit_params :region_id, :district_name_uk, :name_uk, :district_name_ru, :name_ru,
    :region_status, :phone_code, :latitude, :longitude

  controller do
    def scoped_collection
      super.includes :region
    end
  end

  filter :region
  filter :slug_or_district_name_uk_or_name_uk_or_district_name_ru_or_name_ru_or_district_name_en_or_name_en_starts_with, as: :string, label: 'Name'
  filter :phone_code
  filter :region_status

  index do
    selectable_column
    column('Region') { |d| content_tag :i, d.region.name }
    column :district_name
    column :name
    column :region_status
    if params[:q] && params[:q].keys.any? {|k| k.start_with?('phone_code') }
      column :phone_code
    end
    actions
  end

  form do |f|
    semantic_errors
    inputs do
      input :region
      input :district_name_uk
      input :name_uk
      input :district_name_ru
      input :name_ru
      input :region_status
      input :phone_code
      input :latitude
      input :longitude
    end
    actions
  end

  show do
    attributes_table do
      row('Region') { |d| content_tag :i, d.region.name }
      row :slug
      row :district_name_uk
      row :name_uk
      row :district_name_ru
      row :name_ru
      row :latitude
      row :longitude
    end
    active_admin_comments
  end
end
