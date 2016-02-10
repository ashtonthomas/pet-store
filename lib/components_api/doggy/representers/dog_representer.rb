require 'roar/representer/json'
require 'roar/decorator'

module DogRepresenter #< Roar::Decorator
  include Roar::Representer::JSON

  # TODO
  # include Grape::Roar::Representer

  property :id, type: Integer
  property :name, type: String
  property :dob, type: Date
  property :favorite_number, type: Integer
end
