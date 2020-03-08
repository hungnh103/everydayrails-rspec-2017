FactoryBot.define do
  factory :user, aliases: [:owner] do
    first_name { "Hung" }
    last_name { "Nguyen" }
    sequence(:email) {|n| "test_data#{n}@email.com"}
    password { "123456" }
  end
end
