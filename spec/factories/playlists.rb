# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :playlist do
    title "MyString"
    description "MyText"
    banner "MyString"
    user nil
  end
end