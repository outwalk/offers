require 'spec_helper'
require 'parsers/hromadske'

describe Parsers::Hromadske do
  include_context 'Internet Source', 'www.hromadske.tv'

  describe '.parse_articles' do
    it 'parses articles from www.hromadske.tv and saves articles into database' do
      article_ids = subject.parse_articles.map(&:id)
      expect(Article.count).to eq 20
      expect(article_ids).to match_array Article.pluck(:id)
    end
  end
end
