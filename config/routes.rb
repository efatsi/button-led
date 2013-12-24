Button::Application.routes.draw do

  root :to => "welcome#show"

  post "/click" => "welcome#click"
end
