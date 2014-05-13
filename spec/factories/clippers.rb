# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :clipper do
    title "MyText"
    author "MyString"
    summary "MyText"
    published "2014-05-13 12:23:30"
    image "MyString"
    source "MyString"
    url "MyText"
  end
end
