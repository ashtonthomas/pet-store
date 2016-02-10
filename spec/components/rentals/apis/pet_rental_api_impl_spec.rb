require 'spec_helper'

def app
  ApplicationApi
end

describe RentalsComponent::PetRentalApiImpl do
  include Rack::Test::Methods

  before do
    @attrs = { name: "Rufus", dob: Time.now.to_date, favorite_number: 13 }
    @dog = Dog.create(@attrs)
  end

  describe 'GET' do
    it 'does something' do
      get "/rentals/pet-rental"

      expect(response_body).to eq( {id: @dog.id}.merge(@attrs).to_json)
    end
  end
end
