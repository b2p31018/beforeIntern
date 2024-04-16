# app/controllers/users/articles_controller.rb
class Users::ArticlesController < ApplicationController
  def index
    # 一覧表示のための処理
    @articles = Article.all
  end

  def show
    # 詳細表示のための処理
    @article = Article.find(params[:id])
  end

  def new
    # 新規作成画面の表示
    @article = Article.new
  end

  def create
    # 新規作成処理
    @article = Article.new(article_params)
    if @article.save
      redirect_to users_articles_path, notice: "記事を作成しました"
    else
      render :new
    end
  end

  def edit
    # 編集画面の表示
    @article = Article.find(params[:id])
  end

  def update
    # 更新処理
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to users_article_path(@article), notice: "記事を更新しました"
    else
      render :edit
    end
  end

  def destroy
    # 削除処理
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to users_articles_path, notice: "記事を削除しました"
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :image)
  end
end
