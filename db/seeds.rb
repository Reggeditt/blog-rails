# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: 'Jack Tonto', photo: 'https://picsum.photos/200', bio: 'some guy from Mexico.', posts_counter: 0)
user2 = User.create(name: 'John Doe', photo: 'https://picsum.photos/200', bio: 'some guy from Alaska.', posts_counter: 0)
user3 = User.create(name: 'Joe Smith', photo: 'https://picsum.photos/200', bio: 'some guy from Canada.', posts_counter: 0)

first_post = Post.create(author: user1, title: 'Hello', text: 'This is my first post', commentscounter: 0, likescounter: 0)
second_post = Post.create(author: user2, title: 'Hello', text: 'This is my first post', commentscounter: 0, likescounter: 0)
third_post = Post.create(author: user3, title: 'Hello', text: 'This is my first post', commentscounter: 0, likescounter: 0)

Comment.create(author: user1, post: first_post, text: 'This is my first comment')
Comment.create(author: user2, post: second_post, text: 'This is my first comment')
Comment.create(author: user3, post: third_post, text: 'This is my first comment')

Like.create(author: user1, post: first_post)
Like.create(author: user2, post: second_post)
Like.create(author: user3, post: third_post)
