# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
      email "test@test.ru"
      password "123456"
    end
end