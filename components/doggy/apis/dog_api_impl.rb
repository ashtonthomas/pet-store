module DoggyComponent
  class DogApiImpl < Grape::API
    include Mondavi::Api

    url_prefix '/doggy/dogs'

    route_param :id do
      desc 'Just get it. Test overriding this during specs'
      get do
        dog = Dog.find(params[:id])
        dog.extend(DogRepresenter)
      end
    end

    namespace :random do
      get 'random_dog' do
        dog = Dog.first
        dog.extend(DogRepresenter)
      end
    end

  end
end
