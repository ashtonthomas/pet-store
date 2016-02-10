module IndexComponent
  class IndexApiImpl < Grape::API
    get '/' do
      IndexComponent::BuildIndex.call.to_json
    end
  end
end
