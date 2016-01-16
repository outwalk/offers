# encoding: utf-8
# == Schema Information
#
# Table name: districts
#
#  id               :integer          not null, primary key
#  region_id        :integer          not null
#  slug             :string(255)      not null
#  district_name_uk :string(255)
#  name_uk          :string(255)      not null
#  district_name_ru :string(255)
#  name_ru          :string(255)      not null
#  district_name_en :string(255)
#  name_en          :string(255)      not null
#  phone_code       :string(255)
#  region_status    :boolean          default(FALSE), not null
#  latitude         :decimal(12, 8)
#  longitude        :decimal(12, 8)
#  offers_count     :integer          default(0), not null
#  mk_district_id   :integer
#  has_metro        :boolean          default(FALSE), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryGirl.define do
  factory :district do
    region
    district_name_uk 'Київ'
    locality_name_uk 'Київ'
    district_name_ru 'Киев'
    locality_name_ru 'Киев'
    phone_code '44'
    region_status true
    latitude 50.45000000
    longitude 30.52333330
    mk_district_id 14
  end
end
