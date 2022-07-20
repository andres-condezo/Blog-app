require 'rails_helper'

RSpec.describe 'Posts controller', type: :request do
  before(:all) do
    @author = User.create(name: 'Tom',
                          photo: 'https://images513-2c110a25bd8c&q=80',
                          bio: 'I am a teacher from Mexico',
                          posts_counter: 0)

    @post = Post.create(author: @author,
                        title: 'post 1',
                        text: 'text 1',
                        comments_counter: 0,
                        likes_counter: 0)
  end

  context 'GET #index' do
    before { get user_posts_path(@author.id) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'the response body includes correct placeholder text.' do
      expect(response.body).to include('text 1')
    end
  end

  context 'GET #show' do
    before { get user_post_path(@author.id, @post.id) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'the response body includes correct placeholder text.' do
      expect(response.body).to include('post 1')
    end
  end
end
