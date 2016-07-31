FactoryGirl.define do
  factory :comment do
    commentable_id   SecureRandom.uuid
    commentable_type 'Post'
    user_name        FFaker::Name.name
    body             FFaker::LoremFR.paragraph
  end
end
