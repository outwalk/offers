require 'spec_helper'

describe AdminNotifier do
  describe '#new_articles' do
    let(:letter) { ActionMailer::Base.deliveries.last }
    let!(:admin) { create(:user, email: 'admin@example.com', admin: true) }
    let(:articles) { create_list(:article, 4, title: 'The Article Title', language: 'uk') }
    before { described_class.new_articles(articles).deliver_now }

    it 'sends letter to admin' do
      expect(letter.to).to eq ['admin@example.com']
    end

    it 'sends letter from default action_mailer config' do
      expect(letter.from).to eq ['no-reply@example.com']
    end

    it "has always same sublect" do
      expect(letter.subject).to eq '[Offers] Parsed and translated new articles'
    end

    it "letter's body includes links to all new articles" do
      expect(letter.body).to match /<li><a href="http:\/\/localhost:3000\/articles\/\d+\?locale=uk">The Article Title<\/a><\/li>/
    end

    it "letter's body includes total count of new articles" do
      expect(letter.body).to include 'Total: 4'
    end
  end
end
