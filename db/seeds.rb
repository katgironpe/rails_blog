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

# Populate DB with comments
Post.all.each do |post|
  1000.times do
    post.comments.create(user_name: FFaker::Name.name, body: FFaker::LoremFR.paragraph)
  end
end
