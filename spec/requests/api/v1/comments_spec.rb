require 'swagger_helper'

RSpec.describe 'api/v1/comments', type: :request do
  signin_user
  path '/api/v1/posts/{post_id}/comments' do
    # You'll want to customize the parameter types...
    parameter name: 'post_id', in: :path, type: :string, description: 'post_id'

    get('list comments') do
      response(200, 'successful') do
        let(:post_id) { '123' }

        response '201', 'Post created' do
          schema type: :object,
                 properties: [{
                   id: { type: :string }
                 }]
          let(:comment) { { text: 'Text' } }
          let(:post_id) { FactoryBot.create(:post_with_comments, user: @user).id }
          run_test!
        end
      end
    end

    post('create comment') do
      produces 'application/json'
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        }
      }

      response '201', 'Post created' do
        let(:comment) { { text: 'Text' } }
        let(:post_id) { FactoryBot.create(:post, user: @user).id }
        run_test!
      end
    end
  end
end
