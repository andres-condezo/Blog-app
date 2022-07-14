require 'rails_helper'

RSpec.describe 'Posts controller', type: :request do
  describe 'GET #index' do
    before(:each) { get '/users/:user_id/posts' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'the response body includes correct placeholder text.' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET #show' do
    before(:each) { get '/users/:user_id/posts/:id' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('show')
    end
    it 'the response body includes correct placeholder text.' do
      expect(response.body).to include('Here is a post for a given user')
    end
  end
end
