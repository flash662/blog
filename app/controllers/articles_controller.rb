class ArticlesController < ApplicationController

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

      flash[:success] = '儲存成功'
      redirect_to action: :index

    rescue Exception => e
      flash.now[:alert] = e.message
      render :new
    end

  end

  def edit
    @article = Article.find(params[:id])
  end

  def update

  end

  def destroy

  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
