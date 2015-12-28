Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  mount Rapidfire::Engine => "/rapidfire"
  root to: "survey#home"
  get '/program' => "survey#program"
end
