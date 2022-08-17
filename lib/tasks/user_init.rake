namespace :blog do
  desc "建立初始資料"
  task :init => :environment do
    # init user & articles
    5.times {
      u = User.create(email: Faker::Internet.email, password: "123456")
      puts "user: #{u.email} created!!"

      blog = u.create_blog(
        handler: Faker::Internet.user_name(separators: "_"),
        title: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraphs.join
      )
      puts "blog: #{blog.handler} created!!"

      30.times {
        article = u.articles.create(
          title: Faker::Lorem.sentence,
          content: Faker::Lorem.paragraphs.join
        )
        puts "  title: #{article.title} created!!"
      }
    }
  end
end
