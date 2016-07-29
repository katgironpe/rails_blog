User.create!(first_name: 'Kath', last_name: 'Pe', email: 'kath@fakedomain.tld', password: 'SecurePassword12345', password_confirmation: 'SecurePassword12345')

user = User.first
user.confirm

10.times do
  post = Post.new
  post.user_id = user.id
  post.title = FFaker::Movie.title
  post.body = FFaker::LoremFR.paragraphs(5).join("\n")
  post.save!
end
