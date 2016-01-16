module TranslateHelper
  DICTIONARY = YAML.load(File.read(Rails.root.join('config', 'dictionary.yml')))

  def translate(text, from, to)
    return if text.blank?
    require 'google_translate_scraper'
    GoogleTranslateScraper.translate(source_language: from, target_language: to,
      search_text: text).translations.first.try(:translated_text)
  end

  def translate_html(html, from, to)
    return if html.blank?
    require 'nokogiri'
    doc = Nokogiri::HTML::fragment(html)
    doc.css('p').each do |p|
      next if p.text.blank?
      translated_text = translate(p.text, from, to)
      return if translated_text.blank?
      p.content = translated_text
    end
    doc.to_html
  end
end
