require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @author = User.create(name: 'tom', photo: 'https://example.com/test.jpg', bio: 'I am a teacher from mexico',
                          posts_counter: 0)

    @post = Post.create(
      author: @author,
      title: 'Test Post',
      text: 'I am a test post',
      comments_counter: 5,
      likes_counter: 10
    )
  end

  context 'post creation' do
    it 'to be present' do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it 'to not have more than 250 characters' do
      @post.title = 'a' * 251
      expect(@post).to_not be_valid
    end
  end

  context '.comments_counter' do
    it 'to be present' do
      @post.comments_counter = nil
      expect(@post).to_not be_valid
    end

    it 'to be an integer' do
      @post.comments_counter = 1.5
      expect(@post).to_not be_valid
    end

    it 'to be greater than or equal to zero' do
      @post.comments_counter = -1
      expect(@post).to_not be_valid
    end
  end

  context '.likes_counter' do
    it 'to be present' do
      @post.likes_counter = nil
      expect(@post).to_not be_valid
    end

    it 'to be an integer' do
      @post.likes_counter = 1.5
      expect(@post).to_not be_valid
    end

    it 'to be greater than or equal to zero' do
      @post.likes_counter = -1
      expect(@post).to_not be_valid
    end
  end
end
