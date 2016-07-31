FactoryGirl.define do
  factory :post do
    user_id SecureRandom.uuid
    title FFaker::Movie.title
    body FFaker::LoremFR.paragraph
  end
end
