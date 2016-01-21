# == Schema Information
#
# Table name: articles
#
#  id                :integer          not null, primary key
#  slug              :string(255)      not null
#  language          :string(255)      not null
#  source            :string(255)
#  source_url        :string(255)
#  category          :string(255)      not null
#  section           :string(255)
#  title             :string(255)      not null
#  description       :text(65535)      not null
#  images            :text(65535)      not null
#  intro             :text(65535)      not null
#  body              :text(65535)      not null
#  author            :string(255)
#  written_on        :date             not null
#  origin_id         :integer
#  uk_translation_id :integer
#  ru_translation_id :integer
#  en_translation_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'russian/transliteration'
require 'ukrainian/transliteration'

class Article < ActiveRecord::Base
  # Includes
  include TruncateHtmlHelper
  include ActionView::Helpers::TextHelper
  include TranslateHelper

  # Before, after callbacks
  before_save :assign_defaults

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  belongs_to :origin, class_name: 'Article'
  belongs_to :uk_translation, class_name: 'Article'
  belongs_to :ru_translation, class_name: 'Article'
  belongs_to :en_translation, class_name: 'Article'
  has_many :translations, class_name: 'Article', foreign_key: :origin_id

  # Validations: presence > by type > validates
  validates :language, :category, :title, :body, presence: true
  validates :source_url, uniqueness: { scope: :language }, allow_nil: true, allow_blank: true

  # Other properties (e.g. accepts_nested_attributes_for)
  paginates_per 25
  serialize :images, JSON

  # Model dictionaries, state machine

  # Scopes
  class << self
    def category_exists?(category)
      where(language: I18n.locale, category: category).exists?
    end

    def section_exists?(section)
      section.present? && where(language: I18n.locale, section: section).exists?
    end

    def recent
      select(:id, :title).where(language: I18n.locale).order(id: :desc).limit(10)
    end

    def categories
      where(language: I18n.locale).group(:category).pluck(:category)
    end
  end

  # Other model methods
  def create_translation(to)
    return if read_attribute(:"#{to}_translation_id")
    translations.create(
      language: to,
      source: source,
      source_url: source_url,
      category: DICTIONARY[language][to][category] || translate(category, language, to),
      section: DICTIONARY[language][to][section] || translate(section, language, to),
      title: translate(title, language, to),
      description: translate(description, language, to),
      body: translate_html(body, language, to),
      images: images,
      author: author,
      written_on: written_on
    ).tap { |a| update_column(:"#{to}_translation_id", a.id) }
  end

  def create_ru_translation
    create_translation('ru')
  end

  def create_en_translation
    create_translation('en')
  end

  # Private methods (for example: custom validators)
  private

    def assign_defaults
      self.slug ||= case language
      when 'en' then title.strip.gsub(/[\s\-_]+/, '-').gsub(/[^A-Za-z0-9\-]/, '').squeeze('-').downcase
      when 'ru' then Russian.transliterate(title.strip).gsub(/[\s\-_]+/, '-').gsub(/[^A-Za-z0-9\-]/, '').squeeze('-').downcase
      else Ukrainian.slugify(title, skip_unknown: false).gsub(/[^\w\-]/, '').squeeze('-')
      end
      self.intro = truncate_html body.gsub(/<img[^<>]*>/, ''), length: 600
      self.written_on ||= Date.today
      self.description ||= truncate(strip_tags(intro), length: 200, separator: ' ', omission: '...')
      self.images ||= []
    end
end
