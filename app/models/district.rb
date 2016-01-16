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

class District < ActiveRecord::Base
  # Includes

  # Before, after callbacks
  before_save :assign_slug

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  belongs_to :region
  has_many :localities
  has_many :metro_stations

  # Validations: presence > by type > validates
  validates :region, :name_uk, :name_ru, presence: true
  validates :name_uk, :name_ru, uniqueness: { scope: :region_id, case_sensitive: false }

  # Other properties (e.g. accepts_nested_attributes_for)
  alias_attribute :locality_name_uk, :name_uk
  alias_attribute :locality_name_ru, :name_ru
  alias_attribute :locality_name_en, :name_en

  # Model dictionaries, state machine

  # Scopes
  class << self
    def find_id_by_name(name)
      return if name.blank?
      where(arel_table[:name_ru].eq(name).or(arel_table[:name_uk].eq(name))).limit(1).pluck(:id).first
    end
  end

  # Other model methods
  def full_name
    [district_name, name].reject(&:blank?).uniq.join(' / ')
  end

  def locality_name
    read_attribute(:"name_#{I18n.locale}")
  end

  def district_name
    read_attribute(:"district_name_#{I18n.locale}")
  end

  def name(options = {})
    options[:district] && district_name.present? ? district_name : locality_name
  end

  # Private methods (for example: custom validators)
  private

    def assign_slug
      self.slug = Ukrainian::Transliteration.slugify(name_uk)
      self.name_en = Ukrainian::Transliteration.transliterate(name_uk, skip_unknown: true)
      self.district_name_en = district_name_uk.present? ? "#{name_en} Raion" : nil
    end
end
