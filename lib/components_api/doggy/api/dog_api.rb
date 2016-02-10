module DogComponent
  class DogApi
    include Mondavi::RequestRouter

    # register_[http_verb] method_name, url_variables
    register_get :get, :id
  end
end
