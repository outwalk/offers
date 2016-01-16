require 'open-uri'
require 'nokogiri'

module Parsers
  module Oilprice
    extend ActionView::Helpers::TagHelper
    extend ActionView::Helpers::AssetTagHelper

    def self.parse_articles
      main_page = Nokogiri::HTML(open('http://oilprice.com'))
      main_page.css('ul.clear a').group_by { |a| a['href'] }.map { |as| as.last.first }.map do |a|
        source = a['href']
        next if Article.where(source: source).exists?

        category, section = source.sub('http://oilprice.com/', '').
          split('/', 3)[0..-2].map { |s| s.gsub(/[^\w\-]/, '').gsub('-', ' ') }

        page = Nokogiri::HTML(open(source))

        written_on = if page.children.css('span.meta-date').text =~ /Posted on (.+) \|/
          Date.parse($1) rescue Date.today
        else
          Date.today
        end

        title = page.css('h1').text
        description = page.xpath('//meta[@name="description"]/@content').map(&:value).first

        paragraphs = page.css('div#news-content p, div#article-content p, div#interview-content p').
          reject { |p| p.text =~ /\ARelated article: |\ARelated: /im }

        author = nil
        1.upto(4) do |i|
          if paragraphs[-i].text =~ /\ABy\.? (.+)/ && paragraphs[-i].text.size < 40
            author = $1.sub(/ (?:of|via) .+$/im, '').sub(/^By\.?\s+/im, '').sub(', Editor Oilprice.com', '').sub('for Oilprice.com', '').strip
            paragraphs = paragraphs[0..(-i-1)]
          end
        end

        html_body = paragraphs.map do |p|
          p.xpath('img').map { |el| el['src'] }.map do |img_url|
            image_tag img_url, class: 'img-responsive img-rounded picture'
          end.tap do |image_tags|
            image_tags << content_tag(:p, p.text) if p.text.present?
          end
        end.join("\n")

        Article.create(
          language: 'en',
          source: 'oilprice',
          category: category,
          section: section,
          title: title,
          body: html_body,
          description: description,
          author: author,
          source_url: source,
          written_on: written_on
        )
      end.compact
    end
  end
end
