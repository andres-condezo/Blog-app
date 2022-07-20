require 'rails_helper'

RSpec.describe 'Users controller', type: :request do
  before(:all) do
    @author = User.create(name: 'Tom',
                          photo: 'https://images513-2c110a25bd8c&q=80',
                          bio: 'I am a teacher from Mexico',
                          posts_counter: 0)
  end

  context 'GET #index' do
    before { get users_path }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'the response body includes correct placeholder text.' do
      expect(response.body).to include('Tom')
    end
  end

  context 'GET #show' do
    before(:each) { get "/users/#{@author.id}" }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('show')
    end

    it 'the response body includes correct placeholder text.' do
      expect(response.body).to include('I am a teacher from Mexico')
    end
  end
end
