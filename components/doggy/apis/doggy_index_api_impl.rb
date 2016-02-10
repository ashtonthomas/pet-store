module DoggyComponent
  class IndexApiImpl < Grape::API
    # This can be dynamically generated using the Grape::API
    # and then teh AppName/AppURL...
    get '/' do
      # This may need to be a list of all the concepts in this component
      {
        get: {
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
          available_methods: [:get, :put, :post, :delete]
        },

        random_dog: {
          url_template: "https://pet-store-1231231231.herokuapp.com",
          urn_path_template: "/doggy/dogs/random/random_dog",
          url_variables: {},
          formats: [
            :xml,
            :json,
            :binary,
            :txt
          ],
          available_methods: [:get]
        }

      }
    end
  end
end
