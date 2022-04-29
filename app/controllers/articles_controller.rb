class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
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

  def destroy
  end

  private

  def restaurant_params
    params.require(:article).permit(:title, :content)
  end

end
