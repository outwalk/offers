ActiveAdmin.register Agency do
  menu priority: 60

  permit_params :user_id, :slug, :name, :full_name, :summary, :description, :logo,
    :region_id, :district_id, :address,
    :phone_first, :phone_second, :phone_third, :phone_fourth, :email, :site,
    :latitude, :longitude, :visible, :rank, :import_enabled, :import_type, :xml_url, :offers_count,
    :twitter_enabled, :twitter_email, :twitter_password, :twitter_username, :twitter_consumer_key,
    :twitter_consumer_secret, :twitter_oauth_token, :twitter_oauth_token_secret

  controller do
    def scoped_collection
      super.includes :user, :region, :district
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :email
    column('User') { |a| a.user.name }
    column :offers_count
    actions
  end

  filter :name

  form do |f|
    inputs do
      input :user_id
      input :slug
      input :name
      input :full_name
      input :summary, input_html: { rows: 2 }
      input :description, input_html: { rows: 2 }
      input :logo
      input :region
      input :district
      input :address
      input :phone_first
      input :phone_second
      input :phone_third
      input :phone_fourth
      input :email
      input :site
      input :visible
      input :rank
      input :import_enabled
      input :import_type
      input :xml_url, label: 'XML URL'
    end
    actions
  end

  show do
    attributes_table do
      row :user_id
      row :slug
      row :name
      row :full_name
      row :summary
      row :description
      row :logo
      row :region
      row :district
      row :address
      row :phone_first
      row :phone_second
      row :phone_third
      row :phone_fourth
      row :email
      row :site
      row :visible do |a|
        status_tag a.visible? ? 'YES' : 'NO'
      end
      row :rank
      row :import_enabled
      row :import_type
      row :xml_url
      row :offers_count
    end
    active_admin_comments
  end
end
