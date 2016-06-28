class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create

    begin

      @article = Article.new article_params
      @article.save!

      flash[:success] = t('save.success')
      redirect_to action: :index

    rescue Exception => e
      flash.now[:alert] = e.message
      render :new
    end

  end

  def edit

  end

  def update

    begin

      @article.update! article_params

      flash[:success] = t('save.success')
      redirect_to action: :index

    rescue Exception => e
      flash.now[:alert] = e.message
      render :edit
    end

  end

  def destroy

  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
