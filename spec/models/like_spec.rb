require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @author1 = User.create(name: 'Test User', photo: 'https://example.com/test.jpg', bio: 'I am a test user ',
                           posts_counter: 0)

    @author2 = User.create(name: 'Another Test User', photo: 'https://example.com/test2.jpg',
                           bio: 'I am another test user', posts_counter: 0)

    @post_author1 = Post.create(
      author: @author1,
      title: 'Author 1 Test Post',
      text: 'I am a test post'
    )

    @post_author2 = Post.create(
      author: @author2,
      title: 'Author 2 Test Post',
      text: 'I am a test post'
    )

    @likes_author1 = Like.create(author: @author1, post: @post_author2)
    @likes_author1 = Like.create(author: @author1, post: @post_author2)
    @likes_author2 = Like.create(author: @author2, post: @post_author1)
    @likes_author2 = Like.create(author: @author2, post: @post_author1)
  end

  context '.likes_counter' do
    it 'incremments the likes_counter from 0 to 2 for author1' do
      expect(@post_author1.likes_counter).to eq 2
    end
  end
end
