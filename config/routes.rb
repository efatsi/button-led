Button::Application.routes.draw do
  root :to => "welcome#show"

  post "/click" => "welcome#click"

  scope :api do
    get "/status" => "status#show"
    put "/status" => "status#update"
  end
end
