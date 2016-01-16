ActiveAdmin.register User do
  menu priority: 10
  permit_params :email, :confirmed_at, :name, :phone_first, :phone_second,
   :phone_third, :phone_fourth, :slogan, :admin

  scope :admins

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :confirmed_at, as: :datetime_picker
      f.input :name
      f.input :phone_first, null: false
      f.input :phone_second
      f.input :phone_third
      f.input :phone_fourth
      f.input :slogan
      f.input :admin
    end
    f.actions
  end

  show do
    attributes_table do
      row :email
      row :confirmed_at
      row :name
      row :phone_first, null: false
      row :phone_second
      row :phone_third
      row :phone_fourth
      row :slogan
      row :admin
      row :terms_of_service
      row :subscribed
    end
    active_admin_comments
  end
end
