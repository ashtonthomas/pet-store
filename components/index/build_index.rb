class IndexComponent::BuildIndex
  include Operation

  def call
    dog_info = WineComponent::WineIndexApi.get(
      url: 'https://pet-store-123456.herokuapp.com',
      urn_path: '/doggy/index'
    )

    {
      requested_at: Time.now,
      concepts: {
        "DogComponent::DogApi" => dog_info
      }
    }
  end
end
