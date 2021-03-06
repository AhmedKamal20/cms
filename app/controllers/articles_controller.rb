class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  def index
    render json: Article.all, status: :ok
  end

  def show
    render json: @article, status: :ok
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render json: @article, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      render json: @article, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    head :no_content
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.permit(:title, :description, :user_id)
    end
end
