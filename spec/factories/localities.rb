# encoding: utf-8
# == Schema Information
#
# Table name: localities
#
#  id           :integer          not null, primary key
#  region_id    :integer          not null
#  district_id  :integer          not null
#  slug         :string(255)      not null
#  category     :string(255)      not null
#  name_uk      :string(255)      not null
#  name_ru      :string(255)      not null
#  name_en      :string(255)      not null
#  phone_code   :string(255)
#  non_admin    :boolean          default(FALSE), not null
#  latitude     :decimal(12, 8)
#  longitude    :decimal(12, 8)
#  offers_count :integer          default(0), not null
#  mk_settle_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :locality do
    region
    district
    category 'suburb'
    name_uk 'Вишневе'
    name_ru 'Вишневое'
    phone_code '4598'

    factory :sub_locality do
      category 'district'
      name_uk 'Дніпровський'
      name_ru 'Днепровский'
      latitude 50.45358730
      longitude 30.60152100
      mk_settle_id 372
    end
  end
end
