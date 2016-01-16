# == Schema Information
#
# Table name: metro_stations
#
#  id          :integer          not null, primary key
#  district_id :integer          not null
#  name_uk     :string(255)      not null
#  name_en     :string(255)      not null
#  name_ru     :string(255)      not null
#  color       :string(255)      not null
#  sequence    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class MetroStation < ActiveRecord::Base
  # Includes

  # Before, after callbacks
  before_save :assign_name_en
  after_save :check_if_district_has_metro
  after_destroy :check_if_district_has_metro

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  belongs_to :district

  # Validations: presence > by type > validates
  validates :district, :name_uk, :name_ru, :color, :sequence, presence: true
  validates :name_uk, :name_ru, uniqueness: { scope: :district_id, case_sensitive: false }

  # Other properties (e.g. accepts_nested_attributes_for)

  # Model dictionaries, state machine

  # Scopes
  class << self
    def district_ids
      @district_ids ||= group(:district_id).pluck(:district_id)
    end

    def find_id_by_name(name)
      return if name.blank?
      where(arel_table[:name_ru].eq(name).or(arel_table[:name_uk].eq(name))).limit(1).pluck(:id).first
    end
  end

  # Other model methods
  def name
    read_attribute(:"name_#{I18n.locale}")
  end

  # Private methods (for example: custom validators)
  private

    def assign_name_en
      self.name_en = Ukrainian::Transliteration.transliterate(name_uk, skip_unknown: false)
    end

    def check_if_district_has_metro
      district.update_column :has_metro, district.metro_stations.exists?
    end
end
