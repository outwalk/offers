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

class Region < ActiveRecord::Base
  # Includes

  # Before, after callbacks

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  has_many :districts

  # Validations: presence > by type > validates
  validates :slug, :name_uk, :name_ru, :name_en, presence: true
  validates_format_of :slug, with: /\A[a-z-]+\Z/, allow_blank: true

  # Other properties (e.g. accepts_nested_attributes_for)

  # Model dictionaries, state machine

  # Scopes
  class << self
    def find_id_by_name(name)
      return if name.blank?
      return crimea.try(:id) if name.include?('Крым') || name.include?('Крим')
      name = name.sub(/область|обл\.|обл/, '').strip << ' обл.'
      where(arel_table[:name_ru].eq(name).or(arel_table[:name_uk].eq(name))).limit(1).pluck(:id).first
    end

    def crimea
      @crimea ||= where(slug: 'krym').first
    end
  end

  # Other model methods
  def name
    read_attribute(:"name_#{I18n.locale}")
  end

  # Private methods (for example: custom validators)
end
