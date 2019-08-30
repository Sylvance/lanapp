# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    email "MyString"
    bio "MyText"
    password_digest "JsonWebToken::encode(user_id: user.id)"
  end
end
