require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      user = User.create(name: 'wale', bio: 'short bio')
      post = Post.new(title: 'Post 1', text: 'Post 1 content')
      comment = Comment.create(text: 'Comment 1')
      user.posts << post
      post.update_post_counter
      post.comments << comment
      user.comments << comment
      get user_posts_path(user.id)
    end
    it 'should return http status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'should list all the posts for a user in the correct view' do
      expect(response).to render_template(:index)
      expect(response).to_not render_template(:show)
      assert_template 'posts/index'
    end

    it 'should include Post 1 Number of posts:1 in the body' do
      expect(response.body).to include('Post 1')
      expect(response.body).to include('Number of posts:1')
      expect(response.body).to include('Comments: 1')
      expect(response.body).to include('wale:')
      expect(response.body).to include('Comment 1')
    end
  end

  describe 'GET /show' do
    before(:each) do
      user = User.create(name: 'wale', bio: 'short bio')
      post = Post.new(title: 'Post 1', text: 'Post 1 content')
      comment = Comment.create(text: 'Comment 1')
      user.posts << post
      post.update_post_counter
      post.comments << comment
      user.comments << comment
      get user_post_path(user.id, post.id)
    end
    it 'should return http status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'should render a post of user in the correct view' do
      expect(response).to render_template(:show)
      expect(response).to_not render_template(:index)
      assert_template 'posts/show'
    end

    it 'should include post and comments in the body' do
      expect(response.body).to include('Like')
      expect(response.body).to include('Comments: 1')
      expect(response.body).to include('wale:')
      expect(response.body).to include('Post 1 by wale')
    end
  end
end
