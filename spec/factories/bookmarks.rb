# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bookmark do
    title "MyText"
    published "2014-06-08 17:08:01"
    source "MyString"
    team "MyString"
    url "MyText"
    date_bookmarked "2014-06-08 17:08:01"
  end
end
