FactoryGirl.define do
  factory :tagging do
    tag_id        SecureRandom.uuid
    taggable_id   SecureRandom.uuid
    taggable_type 'Post'
  end
end

