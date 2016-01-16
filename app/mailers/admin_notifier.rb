class AdminNotifier < ActionMailer::Base
  default Rails.application.config.action_mailer.default

  def new_articles(articles)
    @articles = articles

    mail to: User.admins.pluck(:email), subject: "[Offers] Parsed and translated new articles"
  end
end
