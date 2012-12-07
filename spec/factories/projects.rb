# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    name "MyString"
    overview "MyText"
    identifier "MyString"
    status_cd 1
  end
end
