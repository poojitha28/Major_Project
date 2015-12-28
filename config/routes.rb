Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  mount Rapidfire::Engine => "/course"
  root to: "survey#home"
  get '/program' => "survey#program"
end
