class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def score
  #action for searching for twitter
  # twitter_handle = params[:q]
  search = params[:q]
  @tweets = $twitter_rest.user_timeline(search)
  @text = []
  @tweets.each do |t|
    @text << t.text
  end
  @text = @text.join 

  #action for searching on alchemy
  @alchemy_results = AlchemyAPI.search(:sentiment_analysis, text: @text)
  @score = @alchemy_results['score']
  @type = @alchemy_results['type']

  redirect_to results_path(:score => @score, :type => @type)

  end 

  def index
  end

  def results
    @score = params[:score]
    @type = params[:score]
  end
end
