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

class Agency < ActiveRecord::Base
  # Includes

  # Before, after callbacks
  phony_normalize :phone_first, :phone_second, :phone_third, :phone_fourth,
    default_country_code: 'UA'

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  belongs_to :user
  belongs_to :region
  belongs_to :district

  # Validations: presence > by type > validates
  validates :name, :full_name, :user, :region, :district, presence: true
  validates :slug, :phone_first, presence: true, uniqueness: { case_sensitive: false }
  validates :phone_first, :phone_second, :phone_third, :phone_fourth, phony_plausible: true
  validates :import_type, :xml_url, presence: true, if: :import_enabled?

  # Other properties (e.g. accepts_nested_attributes_for)
  alias_attribute :xml_url, :import_url

  # Model dictionaries, state machine

  # Scopes
  class << self
  end

  # Other model methods
  def twitter_client
    return unless twitter_enabled?
    require 'twitter'
    @twitter_client ||= Twitter::Client.new(
      consumer_key: twitter_consumer_key,
      consumer_secret: twitter_consumer_secret,
      oauth_token: twitter_oauth_token,
      oauth_token_secret: twitter_oauth_token_secret
    )
  end

  def importer
    import_type.constantize.new(self) if import_enabled?
  end

  # Private methods (for example: custom validators)
end
