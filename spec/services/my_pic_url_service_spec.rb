require 'rails_helper'
require 'faraday'

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

RSpec.describe MyPicUrlService, type: :service do
    it 'initializes MyPicUrlService' do
        faraday = Faraday::Adapter::Test::Stubs.new do |stub|
          stub.get('toto') { |env| [200, {}, 'return_value'] }
        end
        pic = MyPic.new
        service = MyPicUrlService.new(faraday)
        allow(service).to receive(:generateUrl).with(pic).and_return('toto')
        value = service.generateFromPic(pic)
        expect(value).to eq 'return_value'
    end
end
