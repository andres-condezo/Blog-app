require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @author = User.create(name: 'Test User', photo: 'https://example.com/test.jpg', bio: 'I am a test user ',
                          posts_counter: 0)

    @post = Post.create(
      author: @author,
      title: 'Test Post',
      text: 'I am a test post'
    )

    @comment = Comment.create(text: 'I am a test comment', author: @author, post: @post)
  end

  context 'comment creation' do
    it 'belongs to an author' do
      @comment.author = nil
      expect(@comment).to_not be_valid
    end

    it 'belongs to a post' do
      @comment.post = nil
      expect(@comment).to_not be_valid
    end

    it 'validates text presence' do
      @comment.text = nil
      expect(@comment).to_not be_valid
    end
  end
end
