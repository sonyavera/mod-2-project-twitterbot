=begin  
Test accounts to play with: 
 - UN: jakemeout PASS:poopy
 - UN: jakeonya  PASS: today
 - UN: bowie     PASS: doggy

=end

# User.destroy_all
# Topic.destroy_all
# UserTopic.destroy_all
Target.destroy_all
# Tweet.destroy_all

# 10.times do
#     User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Twitter.screen_name)
# end

# 10.times do
#     Topic.create(name: Faker::IndustrySegments.industry)
# end

# 10.times do 
#     UserTopic.create(user_id: User.all.sample.id, topic_id: Topic.all.sample.id)
# end

# 10.times do
#     Tweet.create(user_id: User.all.sample.id, target_id: Target.all.sample.id)
# end

Target.create(name: "Donald Trump", handle: "realdonaldtrump")
Target.create(name: "Ted Cruz", handle: "tedcruz")
Target.create(name: "Laura Ingraham", handle: "ingrahamangle")
Target.create(name: "Jim Jordan", handle: "jim_jordan")
Target.create(name: "Tucker Carlson", handle: "tuckercarlson")
Target.create(name: "Steve Scalise", handle: "stevescalise")
Target.create(name: "Rand Paul", handle: "randpaul")
Target.create(name: "Ron DeSantis", handle: "GovRonDeSantis")