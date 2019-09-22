# frozen_string_literal: true

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    title 'MyString'
    description 'MyText'
    content 'MyString'
    user nil
  end
end
