module DoggyComponent
  class DogApi
    include Mondavi::RequestRouter

    # register_[http_verb] method_name, url_variables
    register_get :get, :id
    register_get :random_dog
  end
end
