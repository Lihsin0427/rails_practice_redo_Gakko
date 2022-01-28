namespace :db do
  desc "產生假課程"
  task :new_courses => :environment do
    u = User.random
    10.times do |i|
      u.courses.create(name: Faker::Book.title,
                       price: Faker::Number.between(from: 10, to: 100),
                       hour: Faker::Number.between(from: 1, to: 20))
    end
  end
end