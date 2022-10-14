class ArticlesController < ApplicationController
  #as show action, the index action expect an 
  #index.html.erb view under views articles folder
  
  def show
    @article = Article.find(params[:id])
  end
   
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end
  
  def edit
    #binding.break replace of byebug in rails 7
    #https://blog.saeloun.com/2021/09/29/rails-7-ruby-debug-replaces-byebug.html
    @article = Article.find(params[:id])
  end

  def create
    #render plain: params[:article]
    #@article = Article.new(params[:article])
    #ActiveModel::ForbiddenAttributesError
    @article = Article.new(params.require(:article).permit(:title, :description))
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
  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was succesfully updated."
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

end

# ?instance variable @ to make this variable available to the rest of aplication to show in show.html.erb
# ? params is a hash params
# ?<ActionController::Parameters {"controller" =>:"articles","action" => "show", "id"="1"} 
# ?permitted: false>