# encoding: utf-8
require 'spec_helper'
require 'google_translate_scraper'
require 'ostruct'

describe 'parse:articles' do
  include_context 'Internet Source', '{oilprice.com,www.hromadske.tv}'
  include_context 'rake'
  let!(:admin) { create(:user, email: 'admin@example.com', admin: true) }
  let(:letter) { ActionMailer::Base.deliveries.reverse.find { |m| m.to = ['admin@example.com'] } }

  before do
    allow(GoogleTranslateScraper).to receive(:translate).with(source_language: 'uk', target_language: 'ru',
        search_text: anything).and_return(OpenStruct.new(translations: [OpenStruct.new(translated_text: 'russian translation')]))

    allow(GoogleTranslateScraper).to receive(:translate).with(source_language: 'uk', target_language: 'en',
        search_text: anything).and_return(OpenStruct.new(translations: [OpenStruct.new(translated_text: 'english translation')]))
  end

  it 'imports new articles from oilprice.com' do
    expect { task.invoke }.to change { Article.where(source: 'oilprice', language: 'en').count }.by(16)
  end

  it 'imports new articles from www.hromadske.tv' do
    expect { task.invoke }.to change { Article.where(source: 'hromadske', language: 'uk').count }.by(20)
  end

  it 'creates russian translations for articles from www.hromadske.tv' do
    expect { task.invoke }.to change { Article.where(source: 'hromadske', language: 'ru').count }.by(20)
  end

  it 'creates english translations for articles from www.hromadske.tv' do
    expect { task.invoke }.to change { Article.where(source: 'hromadske', language: 'en').count }.by(20)
  end

  it 'sends email to admin' do
    task.invoke
    expect(letter.body).to match /<li><a href="http:\/\/localhost:3000\/articles\/\d+\?locale=uk">СБУ оголосила в розшук екс-голову Нацбанка Соркіна<\/a><\/li>/
  end
end
