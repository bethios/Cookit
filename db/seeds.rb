require 'random_data'

50.times do
  Post.create!(
      title:  RandomData.random_sentence,
      body:   RandomData.random_paragraph
  )
end

Post.find_or_create_by!(
        title: "Unique Title",
        body: "Unique body, oh look how unique and magical I am, like a unicorn"
)

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

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} ads created"
puts "#{Question.count} questions created"

