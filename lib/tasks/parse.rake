namespace :parse do
  desc "Imports articles from oilprice.com and hromadske.tv"
  task articles: :environment do
    require 'parsers/oilprice'
    require 'parsers/hromadske'

    articles = []
    articles.concat Parsers::Oilprice.parse_articles
    articles.concat Parsers::Hromadske.parse_articles

    articles.concat Article.where(source: 'hromadske', language: 'uk', ru_translation_id: nil).map(&:create_ru_translation)
    articles.concat Article.where(source: 'hromadske', language: 'uk', en_translation_id: nil).map(&:create_en_translation)

    AdminNotifier.new_articles(articles.compact).deliver_now
  end
end
