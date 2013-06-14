# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "Post Title ##{n}" }
    content "Some sample content for a fake post!"
    user
  end

  factory :user do
    sequence(:username)  { |n| "yoda#{n}" }
    sequence(:email) { |n| "yoda@dagobah#{n}.com" }
    password "foobar29"
    role "author"
  end
end
