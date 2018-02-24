require 'rails_helper'

RSpec.describe MyPic, type: :model do
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:format) }
    it { should validate_presence_of(:width) }
    it { should validate_presence_of(:height) }
end

describe 'POST /my_pic' do
    let(:valid_attributes) { { text: 'Random text', format: 'jpg', width: '100', height: '100' } }

    context 'when the request is valid' do
        before { post '/my_pics', params: valid_attributes }

        it 'creates a my_pic' do
            expect(json['title']).to eq('Learn Elm')
        end

        it 'returns status code 201' do
            expect(response).to have_http_status(201)
        end
    end

    context 'when the request is invalid' do
        before { post '/my_pics', params: { title: 'Foobar' } }

        it 'returns status code 422' do
            expect(response).to have_http_status(422)
        end

        it 'returns a validation failure message' do
            expect(response.body)
            .to match(/Validation failed: Created by can't be blank/)
        end
    end
end
