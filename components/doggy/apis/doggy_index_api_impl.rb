module DoggyComponent
  class IndexApiImpl < Grape::API
    # This can be dynamically generated using the Grape::API
    # and then teh AppName/AppURL...
    get '/' do
      # This may need to be a list of all the concepts in this component
      {
        app_name: "fubar123", #app name may no longer be needed if we use get_const
        url_template: "https://pet-store-1231231231.herokuapp.com",
        urn_path_template: "/doggy/dogs/:id",
        url_variables: {
          id: "the ID of the dog"
        },
        formats: [
          :xml,
          :json,
          :binary,
          :txt
        ],
        available_methods: [:get, :put, :post, :delete],
      }.to_json
    end
  end
end
