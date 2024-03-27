# TODO: add configuration options for template and route

GitVersion::Engine.routes.draw do
  root to: "version#show" #, as: :rails_health_check
end

Rails.application.routes.draw do
  mount GitVersion::Engine => "/version"
end
