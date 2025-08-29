# メインのサンプルユーザーを1人作成する
User.create!(name:  "Masaki",
    email: "uemasaki20011222@gmail.com",
    password:              "20011222",
    password_confirmation: "20011222",
    admin:     true,
    activated: true,
    activated_at: Time.zone.now)

# 追加のユーザーをまとめて生成する
10.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@railstutorial.org"
password = "password"
User.create!(name:  name,
      email: email,
      password:              password,
      password_confirmation: password,
      activated: true,
      activated_at: Time.zone.now)
end

# ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(6)
5.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end