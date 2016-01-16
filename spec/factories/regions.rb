# encoding: utf-8
# == Schema Information
#
# Table name: regions
#
#  id           :integer          not null, primary key
#  slug         :string(255)      not null
#  name_uk      :string(255)      not null
#  name_ru      :string(255)      not null
#  name_en      :string(255)      not null
#  latitude     :decimal(12, 8)
#  longitude    :decimal(12, 8)
#  offers_count :integer          default(0)
#  mk_region_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#


FactoryGirl.define do
  factory :region do
    slug 'chernihivska'
    name_uk 'Чернігівська обл.'
    name_ru 'Черниговская обл.'
    name_en 'Chernihiv Oblast'
    latitude 51.33071340
    longitude 32.03549130
  end
end
