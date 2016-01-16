ActiveAdmin.register Locality do
  menu priority: 40
  config.sort_order = 'id_asc'

  permit_params :region_id, :district_id, :category,
    :name_uk, :name_ru, :non_admin, :phone_code, :latitude, :longitude

  controller do
    def scoped_collection
      super.includes :region, :district
    end
  end

  filter :region, input_html: { onchange: '$(".filter_form").submit();' }
  filter :district, collection: proc { District.ransack((params[:q] || {}).slice(:region_id_eq)).result }
  filter :slug_or_name_uk_or_name_ru_or_name_en_starts_with, as: :string, label: 'Name'
  filter :non_admin
  filter :phone_code

  index do
    selectable_column
    column('Region') { |l| content_tag :i, l.region.name }
    column('District') { |l| content_tag :i, l.district.name(district: l.locality?) }
    column :category
    column :name
    column :administrative do |l|
      status_tag !l.non_admin? ? 'YES' : 'NO'
    end
    if params[:q] && params[:q].keys.any? {|k| k.start_with?('phone_code') }
      column :phone_code
    end
    actions
  end

  form do |f|
    semantic_errors
    inputs do
      if !f.object.region
        input :region, input_html: { onchange: '$("#new_locality").submit();' }
      else
        input :district, collection: f.object.region.districts
        input :category, as: :select, collection: Locality::CATEGORIES
        input :name_uk
        input :name_ru
        input :non_admin
        input :phone_code
        input :latitude
        input :longitude
      end
    end
    actions
  end

  show do
    attributes_table do
      row('Region') { |l| content_tag :i, l.region.name }
      row('District') { |l| content_tag :i, l.district.name(district: l.locality?) }
      row :category
      row :slug
      row :name_uk
      row :name_ru
      row :administrative do |l|
        status_tag !l.non_admin? ? 'YES' : 'NO'
      end
      row :phone_code
      row :latitude
      row :longitude
    end
    active_admin_comments
  end
end
