module IndexComponent
  class IndexApi
    include Mondavi::RequestRouter

    register_get :get
  end
end
