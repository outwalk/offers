# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      not null
#  encrypted_password     :string(255)      not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string(255)
#  locked_at              :datetime
#  authentication_token   :string(255)
#  name                   :string(255)
#  phone_first            :string(255)      not null
#  phone_second           :string(255)
#  phone_third            :string(255)
#  phone_fourth           :string(255)
#  slogan                 :string(255)
#  agency_id              :integer
#  region_id              :integer
#  district_id            :integer
#  locality_id            :integer
#  terms_of_service       :boolean          default(FALSE), not null
#  subscribed             :boolean          default(FALSE), not null
#  language               :string(4)
#  offers_count           :integer          default(0), not null
#  admin                  :boolean          default(FALSE), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:name) { |n| "User#{n}" }
    sequence(:phone_first) { |n| "+3804454#{sprintf("%05d", n)}" }
    password 'secret1234'
    terms_of_service true
    confirmed_at 1.hour.ago
  end
end
