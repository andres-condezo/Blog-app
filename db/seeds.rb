# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Users
first_user = User.create(name: 'Tom', photo: 'https://images.unsplash.com/photo-1607990281513-2c110a25bd8c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80', bio: 'Teacher from Mexico.', posts_counter: 0)
second_user = User.create(name: 'Lilly', photo: 'https://images.unsplash.com/photo-1506863530036-1efeddceb993?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=744&q=80', bio: 'Teacher from Poland.', posts_counter: 0)
third_user = User.create(name: 'Tim', photo: 'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80', bio: 'Teacher from Canada.', posts_counter: 0)

# Posts
first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
second_post = Post.create(author: first_user, title: 'Hello again', text: 'This is my second post', comments_counter: 0, likes_counter: 0)
third_post = Post.create(author: first_user, title: 'Hello again and again', text: 'This is my third post', comments_counter: 0, likes_counter: 0)
fourth_post = Post.create(author: first_user, title: 'Hello', text: 'This is my fourth post', comments_counter: 0, likes_counter: 0)

fifth_post = Post.create(author: second_user, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
sixth_post = Post.create(author: second_user, title: 'Hello again', text: 'This is my second post', comments_counter: 0, likes_counter: 0)
seventh_post = Post.create(author: second_user, title: 'Hello again and again', text: 'This is my third post', comments_counter: 0, likes_counter: 0)

# Comments
Comment.create(post: first_post, author: third_user, text: 'Hi Tom!' )

Comment.create(post: fifth_post, author: third_user, text: 'Hi Lilly!' )
