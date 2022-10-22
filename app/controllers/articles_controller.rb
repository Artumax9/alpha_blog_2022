class ArticlesController < ApplicationController
  #as show action, the index action expect an  #index.html.erb view under views articles folder
  # ?instance variable @ to make this variable available to the rest of aplication to show in show.html.erb
  # ? params is a hash params
  # ?<ActionController::Parameters {"controller" =>:"articles","action" => "show", "id"="1"} 
  # ?permitted: false>

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles/1
  def show
    #@article = Article.find(params[:id])
  end

  # GET /articles 
  def index
    @articles = Article.all
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    #binding.break replace of byebug in rails 7
    #https://blog.saeloun.com/2021/09/29/rails-7-ruby-debug-replaces-byebug.html
    #@article = Article.find(params[:id])
  end

  # POST /articles
  def create
    #render plain: params[:article]
    #@article = Article.new(params[:article])
    #ActiveModel::ForbiddenAttributesError
    @article = Article.new(article_params)
    #render plain: @article.inspect
    if @article.save
      flash[:notice] = "Article was succesfully created."
      #show article
      #redirect_to article_path(@article)
      redirect_to @article
    else
      render 'new'
    end    
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    #@article = Article.find(params[:id]) because or DRY Code
    if @article.update(article_params)
      flash[:notice] = "Article was succesfully updated."
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    #@article = Article.find(params[:id]) because or DRY Code
    @article.destroy
    #Go to articles index route 3
    redirect_to articles_path
  end

  private 
  def set_article
    @article = Article.find(params[:id])
  end  

  def article_params
    params.require(:article).permit(:title, :description)
  end
end

