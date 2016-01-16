# encoding: utf-8
# == Schema Information
#
# Table name: agencies
#
#  id                         :integer          not null, primary key
#  user_id                    :integer          not null
#  slug                       :string(255)      not null
#  name                       :string(255)      not null
#  full_name                  :string(255)      not null
#  summary                    :text(65535)
#  description                :text(65535)
#  logo                       :string(255)
#  region_id                  :integer          not null
#  district_id                :integer          not null
#  address                    :string(255)
#  phone_first                :string(255)      not null
#  phone_second               :string(255)
#  phone_third                :string(255)
#  phone_fourth               :string(255)
#  email                      :string(255)
#  site                       :string(255)
#  latitude                   :decimal(12, 8)
#  longitude                  :decimal(12, 8)
#  visible                    :boolean          default(FALSE), not null
#  rank                       :integer          default(0), not null
#  import_enabled             :boolean          default(FALSE), not null
#  import_type                :string(255)
#  import_url                 :string(255)
#  offers_count               :integer          default(0), not null
#  twitter_enabled            :boolean          default(FALSE), not null
#  twitter_email              :string(255)
#  twitter_password           :string(255)
#  twitter_username           :string(255)
#  twitter_consumer_key       :string(255)
#  twitter_consumer_secret    :string(255)
#  twitter_oauth_token        :string(255)
#  twitter_oauth_token_secret :string(255)
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

FactoryGirl.define do
  factory :agency do
    user
    name 'Альфа Нерухом'
    slug 'al-fa'
    full_name 'Агентство недвижимости «Альфа Нерухом»'
    region
    district
    phone_first '+380961878937'
    phone_second '+380957622018'
    email 'ostap@al-fa.lviv.ua'
    site 'http://al-fa.lviv.ua'
    visible true
    import_enabled true
    import_type 'Importer::Address'
    xml_url 'http://al-fa.lviv.ua/export/address.php?wd'
    twitter_consumer_key '896140c4b075c98f833dc0'
    twitter_consumer_secret '9614fb331826f09901f781e62ae677760a6eb92b79f'
    twitter_oauth_token '939784334-0fdb687a397eba3b364c1ecd5a959c698f78b52'
    twitter_oauth_token_secret '09ae55df70f0d6af4c9ea45e32f89acb58cccc79b07'
  end
end
