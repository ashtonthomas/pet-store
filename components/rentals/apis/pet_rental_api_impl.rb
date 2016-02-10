module RentalsComponent
  class PetRentalApiImpl < Grape::API
    include Mondavi::Api

    url_prefix '/rentals/pet-rental'

    desc 'Get a random pet for a rental'
    get '/' do
      dog = DoggyComponent::DogApi.random_dog
      dog.extend(DogRepresenter)
    end

  end
end
