require 'rails_helper'

RSpec.describe 'Post', type: :request do
  before(:each) do
    get user_posts_path(2)
  end
  describe 'GET /index' do
    it 'should return http status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'should render the correct view' do
      expect(response).to render_template(:index)
      expect(response).to_not render_template(:show)
      assert_template 'posts/index'
    end

    it 'should include List all posts for a selected user in the view' do
      expect(response.body).to include('List all posts for a selected user')
    end
  end
end
