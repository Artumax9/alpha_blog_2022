class ArticlesController < ApplicationController
  #as show action, the index action expect an 
  #index.html.erb view under views articles folder
  
  def show
    @article = Article.find(params[:id])
  end
   
  def index
    @articles = Article.all
    #@articles.each {|article| puts article}
  end

end

# ?instance variable @ to make this variable available to the rest of aplication to show in show.html.erb
# ? params is a hash params
# ?<ActionController::Parameters {"controller" =>:"articles","action" => "show", "id"="1"} 
# ?permitted: false>