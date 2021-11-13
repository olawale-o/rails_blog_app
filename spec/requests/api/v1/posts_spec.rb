require 'swagger_helper'

RSpec.describe 'api/v1/posts', type: :request do
  path '/api/v1/posts' do
    get('list all posts') do
      produces 'application/json'
      consumes 'application/json'
      response(200, 'successful') do
        signin_user
        schema type: :object,
               properties: [{
                 id: { type: :integer },
                 title: { type: :string },
                 text: { type: :string }
               }]
        let(:post) { { user_id: @user.id, title: 'Dodo', text: 'available' } }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/json' }
        run_test!
      end
    end
  end
end
