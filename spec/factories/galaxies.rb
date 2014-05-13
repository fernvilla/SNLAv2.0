# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :galaxy do
    title "MyText"
    author "MyString"
    summary "MyText"
    published "2014-05-13 13:17:44"
    image "MyString"
    source "MyString"
    url "MyText"
  end
end
