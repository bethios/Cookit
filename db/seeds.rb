require 'random_data'

5.times do
  User.create!(
      name:     RandomData.random_name,
      email:    RandomData.random_email,
      password: RandomData.random_sentence
  )
end
users = User.all

15.times do
  Topic.create!(
      name:         RandomData.random_sentence,
      description:  RandomData.random_paragraph
  )
end

topics = Topic.all

12.times do
  SponsoredPost.create!(
      topic: topics.sample,
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph
  )
end

50.times do
  Post.create!(
      user:   users.sample,
      topic:  topics.sample,
      title:  RandomData.random_sentence,
      body:   RandomData.random_paragraph
  )
end

#Post.find_or_create_by!(
#        user: users.sample,
#        title: "Unique Title",
#        body: "Unique body, oh look how unique and magical I am, like a unicorn"
#)

posts = Post.all

100.times do
  Comment.create!(
      post: posts.sample,
      body: RandomData.random_paragraph
  )
end

20.times do
  Advertisement.create!(
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph,
      price: rand(15)
  )
end

advertisements = Advertisement.all

30.times do
  Question.create!(
     title: RandomData.random_sentence + "?",
     body: RandomData.random_paragraph,
     resolved: false
  )
end

questions = Question.all

user = User.first
user.update_attributes!(
        email: 'bethios@gmail.com',
        password: 'abcdef'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} ads created"
puts "#{Question.count} questions created"

