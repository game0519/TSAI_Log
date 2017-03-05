class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: '文章建立完成'
    else
      flash[:alert] = '文章尚未建立'
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: '文章更新完成'
    else
      flash[:alert] = '文章更新失敗'
      render :edit
    end

  end

  def search

  end

  def check_auth

  end

  private
  def article_params
    params.require(:article).permit(:art_cat_id, :art_title, :art_subtitle, :art_content, :art_pic, :art_preview)
  end

end
