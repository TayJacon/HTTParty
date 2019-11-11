require_relative "models/user_model"

FactoryBot.define do
  factory :user, class: UserModel do
    full_name { "Test Skywalker" }
    email { "test@jedi.com" }
    password { "jedi123" }

    after(:build) do |user|
      Database.new.delete_user(user.email)
    end
  end
end
