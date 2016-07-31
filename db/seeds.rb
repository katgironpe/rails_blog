User.create!(first_name: 'Kath', last_name: 'Pe', email: 'kath@fakedomain.tld', password: 'SecurePassword12345', password_confirmation: 'SecurePassword12345')

user = User.first
user.confirm

tags = ['movies', 'science', 'action', 'politics', 'life', 'space', 'physics', 'math', 'finance', 'drama', 'nature', 'history']

10.times do
  post = Post.new
  post.user_id = user.id
  post.title = FFaker::Movie.title
  post.tag_names = %(#{tags.sample(3).join(', ')})
  post.body = FFaker::LoremFR.paragraphs(5).join("\n")
  post.save!
end

10.times do
  article = Article.new
  article.user_id = user.id
  article.tag_names = %(#{tags.sample(5).join(', ')})
  article.title = FFaker::Movie.title
  article.body = FFaker::LoremFR.paragraphs(5).join("\n")
  article.save!
end

# Populate DB with comments
Post.all.each do |post|
  1000.times do
    post.comments.create(user_name: FFaker::Name.name, body: FFaker::LoremFR.paragraph)
  end
end

Article.all.each do |article|
  1000.times do
    article.comments.create(user_name: FFaker::Name.name, body: FFaker::LoremFR.paragraph)
  end
end
