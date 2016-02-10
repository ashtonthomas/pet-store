module DoggyComponent
  class IndexApi
    include Mondavi::RequestRouter

    # This should be the same for every component
    # We can dynamically generate this
    register_get :get, :url, :urn_path
  end
end
