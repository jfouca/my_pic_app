require 'rails_helper'

describe 'POST /my_pic' do
    let(:valid_attributes) { { text: 'Random text', format: 'jpg', width: '100', height: '100' } }

    context 'when the request is valid' do
        before { post '/my_pic', params: valid_attributes }

        it 'creates my_pic' do
            expect(json['text']).to eq('Random text')
            expect(json['format']).to eq('jpg')
            expect(json['width']).to eq(100)
            expect(json['height']).to eq(100)
        end

        it 'returns status code 201' do
            expect(response).to have_http_status(201)
        end
    end

    context 'when the request is invalid' do
        before { post '/my_pic', params: { unknown: 'Foobar' } }

        it 'returns status code 422' do
            expect(response).to have_http_status(422)
        end

        it 'returns a validation failure message' do
            expect(response.body)
            .to match(/Validation failed: Text can't be blank, Format can't be blank, Width can't be blank, Height can't be blank/)
        end
    end
end
