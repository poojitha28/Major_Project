Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  get '/course/:cat_id' => "rapidfire/question_groups#view", as: :survey_show
  mount Rapidfire::Engine => "/course"
  root to: "survey#home"
  get '/program' => "rapidfire/question_groups#program"
end
