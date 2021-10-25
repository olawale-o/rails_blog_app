require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      get user_posts_path(2)
    end
    it 'should return http status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'should list all the posts for user with id = 2 in the correct view' do
      expect(response).to render_template(:index)
      expect(response).to_not render_template(:show)
      assert_template 'posts/index'
    end

    it 'should include Here is a List of posts for a given user in the body' do
      expect(response.body).to include('Here is a List of posts for a given user')
    end
  end

  describe 'GET /show' do
    before(:each) do
      get user_post_path(2, 1)
    end
    it 'should return http status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'should list a post with id = 1 of user with user_id = 2 in the correct view' do
      expect(response).to render_template(:show)
      expect(response).to_not render_template(:index)
      assert_template 'posts/show'
    end

    it 'should include Here is a given post for a given user in the body' do
      expect(response.body).to include('Here is a given post for a given user')
    end
  end
end
