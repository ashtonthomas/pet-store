module DoggyComponent # may not really need to nest under this
  module DogApiPact
    include Mondavi::PactRouter

    pact_for DoggyComponent::DogApi

    pact :get, "{:id=>1}", Hashie::Mash.new(
      representer: DogRepresenter,
      response: {
        id: 1,
        name: "Some Robert Mondavi Classic",
        dob: '2016-02-10',
        favorite_number: 13
      }
    )
  end
end
