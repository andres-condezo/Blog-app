require 'rails_helper'

RSpec.describe User, type: :model do
  before :all do
    @author = User.create(name: 'Tom',
                          photo: 'https://images513-2c110a25bd8c&q=80',
                          bio: 'I am a teacher from Mexico',
                          posts_counter: 0)

    Post.create(author: @author, title: 'post 1', text: 'text 1', comments_counter: 0,
                likes_counter: 0)
    Post.create(author: @author, title: 'post 2', text: 'text 2', comments_counter: 0,
                likes_counter: 0)
    Post.create(author: @author, title: 'post 3', text: 'text 3', comments_counter: 0,
                likes_counter: 0)
  end

  context 'user creation' do
    it 'validates presence of name' do
      @author.name = nil
      expect(@author).to_not be_valid
    end

    it 'bio and photo can be blank' do
      @author.name = 'Tim'
      @author.bio = ''
      @author.photo = ''
      expect(@author).to be_valid
    end
  end

  context '.posts_counter' do
    it 'validates presence' do
      @author.posts_counter = nil
      expect(@author).to_not be_valid
    end

    it 'validates posts_counter greater than or equal to zero' do
      @author.posts_counter = nil
      expect(@author).to_not be_valid
    end
  end

  context '.most_most_recent_posts' do
    it 'should get the 3 most recent posts' do
      expect(@author.recent_posts.length).to eq 3
    end

    it 'should get the last post as the first result' do
      expect(@author.recent_posts.first.title).to eq 'post 3'
    end

    it 'should get the third post as the last result' do
      expect(@author.recent_posts.last.title).to eq 'post 1'
    end
  end
end
