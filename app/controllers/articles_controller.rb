class ArticlesController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @search = Article.ransack(search_params)
    @articles = @search.result.where(language: I18n.locale).order(id: :desc).page(params[:page])

    if params[:category_eq] && Article.category_exists?(params[:category_eq])
      add_breadcrumb I18n.t('articles.index.title'), articles_path
      add_breadcrumb params[:category_eq], articles_path(params.slice(:category_eq))
      if params[:section_eq] && Article.section_exists?(params[:section_eq])
        add_breadcrumb params[:section_eq], articles_path(params.slice(:category_eq, :section_eq))
      end
    end
  end

  def show
    @search = Article.ransack(search_params)
    @article = Article.find(params[:id])
    add_breadcrumb @article.category, articles_path(category_eq: @article.category)
    if @article.section.present?
      add_breadcrumb @article.section,
        articles_path(category_eq: @article.category, section_eq: @article.section)
    end
    add_breadcrumb nil
  end

  private

    def search_params
      params[:body_cont] = params[:q]
      params.permit(:category_eq, :section_eq, :body_cont)
    end
end

