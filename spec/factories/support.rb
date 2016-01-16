# encoding: utf-8
# == Schema Information
#
# Table name: support
#
#  id          :integer          not null, primary key
#  language    :string(255)      not null
#  slug        :string(255)      not null
#  title       :string(255)      not null
#  description :text(65535)
#  body        :text(65535)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


FactoryGirl.define do
  factory :support do
    language 'uk'
    slug 'terms'
    title 'Умови користування'
    body "<h1>Умови користування сайтом</h1>" \
      "<p>Реєструючись на сайті користувач зобов'язується не порушувати закони України</p>" \
      "<p>Розміщувати безкоштовно оголошення на сайті</p>"
  end
end
