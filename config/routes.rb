Rails.application.routes.draw do
  get '/' => 'application#index', as: :home
  get '/results' => 'application#results', as: :results
  get '/score'=> 'application#score', as: :score
end
