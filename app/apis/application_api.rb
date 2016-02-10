class ApplicationApi < Grape::API
  format :json
  extend Napa::GrapeExtenders

  # I would like to generate this dynamically
  mount IndexComponent::IndexApiImpl => '/index'


  mount DoggyComponent::DogApiImpl => '/doggy/dogs'
  # Dynamically generate the component index based on the `rake routes`
  mount DoggyComponent::IndexApiImpl => '/doggy/index'

  mount RentalsComponent::PetRentalApiImpl => '/rentals/pet-rental'

  add_swagger_documentation
end

