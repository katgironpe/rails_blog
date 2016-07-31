FactoryGirl.define do
  factory :article do
    user_id SecureRandom.uuid
    title FFaker::Movie.title
    body FFaker::LoremFR.paragraph
  end
end
