require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:each) do
      get users_path
    end

    it 'should return http status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'should render the correct view' do
      expect(response).to render_template(:index)
      expect(response).to_not render_template(:show)
      assert_template 'users/index'
    end

    it 'should include List all users in the view' do
      expect(response.body).to include('List all users')
    end
  end

  describe 'GET /show' do
    before(:each) do
      get user_path(2)
    end

    it 'should return http status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'should render the correct view' do
      expect(response).to render_template(:show)
      expect(response).to_not render_template(:index)
      assert_template 'users/show'
    end

    it 'should include Here is a list of all user posts in the view' do
      expect(response.body).to include('Here is a list of all user posts')
    end
  end
end
