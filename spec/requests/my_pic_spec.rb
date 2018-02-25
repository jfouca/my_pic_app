require 'rails_helper'

describe 'POST /my_pic' do
    let(:valid_attributes) { { text: 'Random text', format: 'jpg', width: '100', height: '100' } }

    context 'when the request is valid' do
        before { post '/my_pic', params: valid_attributes }

        it 'creates my_pic' do
            expect(response.content_type).to eq 'image/jpg'
        end

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    context 'when the request is invalid' do
        before { post '/my_pic', params: { unknown: 'Foobar' } }

        it 'returns status code 422' do
            expect(response).to have_http_status(422)
        end

        it 'returns a validation failure message' do
            expect(response.body)
            .to match(/Validation failed: Format is not included in the list, Format can't be blank, Width is not a number, Width can't be blank, Height is not a number, Height can't be blank, Text can't be blank/)
        end
    end

    context 'when the request is has invalid parameters' do
        before { post '/my_pic', params: { text: 'Random text', format: 'unknown', width: '-1', height: '-1' } }

        it 'returns status code 422' do
            expect(response).to have_http_status(422)
        end

        it 'returns a validation failure message' do
            expect(response.body)
            .to match(/Validation failed: Format is not included in the list, Width must be greater than or equal to 1, Height must be greater than or equal to 1/)
        end
    end
end
