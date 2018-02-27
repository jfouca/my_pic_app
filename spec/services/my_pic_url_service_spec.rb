require 'rails_helper'
require 'faraday'
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, /placehold.it/).to_return(
        status: 200, body: "stubbed response", headers: {}
      )
  end
end

RSpec.describe MyPicUrlService, type: :service do
    it 'initializes MyPicUrlService' do
        service = MyPicUrlService.new(Faraday.new)
        value = service.generateFromPic(MyPic.new(width: 100, height: 100, format: "png"))
        expect(value).to eq 'stubbed response'
    end
end
