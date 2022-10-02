class ArticlesController < ApplicationController
  def show
    #instance variable @ to make this variable available to the rest of aplication to show in show.html.erb
    #params is a hash params
    #<ActionController::Parameters {"controller" =>:"articles","action" => "show", "id"="1"} 
    #permitted: false>
    @article = Article.find(params[:id])
  end 

end