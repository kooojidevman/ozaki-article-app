# db/seeds.rb

# ライブラリを追加
require 'faker'

# ユーザーデータの作成
5.times do |i|
  user = User.create!(
    name: "user_#{i + 1}",
    email: "user_#{i + 1}@example.com",
    password: 'password',            # テスト用の固定パスワード
    password_confirmation: 'password',
    is_activated: true               # 仮に全員アクティベート済みに
  )

  # ユーザーごとに投稿を3件作成
  3.times do |i|
    Post.create!(
      user: user,
      content: "#{user.name}が投稿したよ。~part#{i + 1}~"
    )
  end
end

puts "Seed data has been created successfully."
