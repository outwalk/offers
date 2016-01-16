class SupportController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @supports = Support.where(language: I18n.locale).order(:id)
  end

  def show
    @support = Support.where(language: I18n.locale, slug: params[:slug]).first!
  end
end
