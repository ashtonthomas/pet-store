class IndexComponent::BuildIndex
  include Operation

  def call
    doggy_info = DoggyComponent::IndexApi.get(
      url: 'https://pet-store-123456.herokuapp.com',
      urn_path: '/doggy/index'
    )

    # rentals_info = RentalsComponent::IndexApi.get(
    #   url: 'https://pet-store-123456.herokuapp.com',
    #   urn_path: '/rentals/index'
    # )

    {
      requested_at: Time.now,
      concepts: {
        "DoggyComponent::DogApi" => doggy_info
      }
    }
  end
end
