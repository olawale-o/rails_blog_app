require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    get users_path
  end
  describe 'GET /index' do
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
end
