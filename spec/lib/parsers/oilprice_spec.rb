require 'spec_helper'
require 'parsers/oilprice'

describe Parsers::Oilprice do
  include_context 'Internet Source', 'oilprice.com'

  describe '.parse_articles' do
    it 'parses articles from oilprice.com and saves articles into database' do
      article_ids = subject.parse_articles.map(&:id)
      expect(Article.count).to eq 16
      expect(article_ids).to match_array Article.pluck(:id)
    end

    it 'does not parse duplicate articles from oilprice.com' do
      subject.parse_articles
      subject.parse_articles
      expect(Article.count).to eq 16
    end
  end
end
