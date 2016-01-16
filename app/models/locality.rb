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

class Locality < ActiveRecord::Base
  # Includes

  # Before, after callbacks
  before_validation :assign_region
  before_save :assign_slug

  # Default scopes, default values (e.g. self.per_page =)
  CATEGORIES = ['city', 'district', 'suburb', 'village'].freeze

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  belongs_to :region
  belongs_to :district

  # Validations: presence > by type > validates
  validates :region, :district, :name_uk, :name_ru, presence: true
  validates :name_uk, :name_ru, uniqueness: { scope: :district_id, case_sensitive: false }
  validates :category, inclusion: { in: CATEGORIES }

  # Other properties (e.g. accepts_nested_attributes_for)

  # Model dictionaries, state machine

  # Scopes
  class << self
    def find_id_by_name(name, options = {})
      return if name.blank?
      return unless l = where(arel_table[:name_ru].eq(name).or(arel_table[:name_uk].eq(name))).first
      options[:with_district_id] ? [l.district_id, l.id] : l.id
    end
  end

  # Other model methods
  def name
    read_attribute(:"name_#{I18n.locale}")
  end

  def locality?
    category != 'district'
  end

  def sub_locality?
    category == 'district'
  end

  # Private methods (for example: custom validators)
  private

    def assign_region
      self.region_id = district.region_id if district
    end

    def assign_slug
      self.slug = Ukrainian::Transliteration.slugify(name_uk)
      self.name_en = Ukrainian::Transliteration.transliterate(name_uk, skip_unknown: true)
    end
end
