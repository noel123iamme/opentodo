if Rails.env.development? 
  require 'faker'

  # Create Users
  5.times do
    user = User.new(
      name:     Faker::Name.name, 
      password: 'helloworld'
    )
    user.save!
  end
  if User.where({name: 'NoelDeguzman'}).count == 0
    user = User.new(
      name:     'NoelDeguzman', 
      password: 'helloworld'
    )
    user.save!
  end
  users = User.all

  15.times do
    list = List.new(
      name: Faker::Lorem.sentence,
      user:  users.sample
    )
    list.save!
  end
  lists = List.all

  50.times do
    item = Item.new(
      name:  Faker::Lorem.sentence,
      body:  Faker::Lorem.paragraph,
      list:  lists.sample
    )
    item.save!
  end
  items = Item.all

  puts "Seed finished"
  users.each do |user|
    puts "#{user.name}"
  end
  puts "#{User.count} users created"
  puts "#{List.count} lists created"
  puts "#{Item.count} items created"
end
