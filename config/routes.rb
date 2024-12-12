Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "boards#index"
  get("/", { :controller => "boards", :action => "index" })
  get("/users", { :controller => "boards", :action => "users" })
  get("/photos", { :controller => "boards", :action => "photos" })
  get("/photos/:path_id", { :controller => "boards", :action => "showPhoto" })
  get("/users/:username", { :controller => "boards", :action => "showUser" })
  get("/users/:username/liked_photos", { :controller => "boards", :action => "likedPhotos" })
  get("/users/:username/feed", { :controller => "boards", :action => "feed" })
  get("/users/discover", { :controller => "boards", :action => "discover" })

  #post("/insert_like")
  #post("/insert_comment")



end
