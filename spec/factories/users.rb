FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@example.com" }
    password 'foobar12345'
    password_confirmation 'foobar12345'
  end

end
