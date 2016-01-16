require 'open-uri'
require 'nokogiri'

module Parsers
  module Hromadske
    extend ActionView::Helpers::TagHelper
    extend ActionView::Helpers::AssetTagHelper
    extend TranslateHelper
    BLACKLIST = ['hromadske.tv']

    def self.parse_articles
      index_doc = Nokogiri::HTML(open('http://www.hromadske.tv/ajax/type_newsline/action_allline/'))
      index_doc.css('span.content-block > a').map { |a| a['href'] }.map do |href|
        next if Article.where(source: href).exists?
        category, slug = href.sub('http://www.hromadske.tv/', '').sub(/\/$/, '').split('/', 2)
        category.capitalize!
        category = TranslateHelper::DICTIONARY['en']['uk'][category] || translate(category, 'en', 'uk')

        doc = Nokogiri::HTML(open(href))

        body = doc.css('div.text-wrapp p').each_with_object([]) do |p, elements|
          p.xpath('img').each do |img|
            img_url = img['src']
            img_url = File.join('http://www.hromadske.tv', img_url) if img_url !~ /^https?:\/\//
            elements << image_tag(img_url, class: 'img-responsive img-rounded picture')
          end
          elements << content_tag(:p, p.text.strip) if p.text.present? && !BLACKLIST.include?(p.text.strip)
        end.join("\n")

        Article.create(
          language: 'uk',
          source: 'hromadske',
          source_url: href,
          category: category,
          title: doc.css('h1.title').first.try(:text),
          description: doc.css('meta[property="og:description"]').first.try(:[], 'content'),
          body: body,
          images: doc.css('div.article-media img').map { |img| img['src'] },
          written_on: parse_date(doc.css('span.subscribe').first.try(:text).try(:strip))
        )
      end.uniq
    end

    def self.parse_date(date)
      Date.parse(date) if date
    rescue ArgumentError
    end
  end
end
