class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def new
    @article = Article.new
  end

  def edit
  end


  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
