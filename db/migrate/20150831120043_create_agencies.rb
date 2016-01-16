class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.integer :user_id, null: false
      t.string :slug, null: false
      t.string :name, null: false
      t.string :full_name, null: false
      t.text :summary
      t.text :description
      t.string :logo
      t.integer :region_id, null: false
      t.integer :district_id, null: false
      t.string :address
      t.string :phone_first, null: false
      t.string :phone_second
      t.string :phone_third
      t.string :phone_fourth
      t.string :email
      t.string :site
      t.decimal :latitude, precision: 12, scale: 8
      t.decimal :longitude, precision: 12, scale: 8
      t.boolean :visible, default: false, null: false
      t.integer :rank, default: 0, null: false
      t.boolean :import_enabled, default: false, null: false
      t.string :import_type
      t.string :import_url
      t.integer :offers_count, default: 0, null: false
      t.boolean :twitter_enabled, default: false, null: false
      t.string :twitter_email
      t.string :twitter_password
      t.string :twitter_username
      t.string :twitter_consumer_key
      t.string :twitter_consumer_secret
      t.string :twitter_oauth_token
      t.string :twitter_oauth_token_secret

      t.timestamps null: false
    end

    add_index :agencies, :user_id
    add_index :agencies, :slug
    add_index :agencies, :name
    add_index :agencies, :phone_first, unique: true
  end
end
