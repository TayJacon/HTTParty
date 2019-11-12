require "faker"
require_relative "../models/user_model"

FactoryBot.define do
  factory :user, class: UserModel do
    full_name { "Test Skywalker" }
    email { "test@jedi.com" }
    password { "jedi123" }

    after(:build) do |user|
      Database.new.delete_user(user.email)
    end
  end

  factory :registered_user, class: UserModel do
    id { 0 }
    full_name { Faker::Movies::StarWars.character }
    email { Faker::Internet.free_email(name: full_name) }
    password { "jedi123" }

    after(:build) do |user|
      Database.new.delete_user(user.email)
      result = ApiUser.save(user.to_hash)
      user.id = result.parsed_response["id"]
    end
  end

  factory :user_wrong_email, class: UserModel do
    full_name { "Test Skywalker" }
    email { "test#jedi.com" }
    password { "jedi123" }
  end

  factory :empty_name_user, class: UserModel do
    full_name { "" }
    email { "test@jedi.com" }
    password { "jedi123" }
  end

  factory :empty_email_user, class: UserModel do
    full_name { "Test Skywalker" }
    email { "" }
    password { "jedi123" }
  end

  factory :empty_password_user, class: UserModel do
    full_name { "Test Skywalker" }
    email { "test#jedi.com" }
    password { "" }
  end

  factory :null_name_user, class: UserModel do
    email { "test@jedi.com" }
    password { "jedi123" }
  end

  factory :null_email_user, class: UserModel do
    full_name { "Test Skywalker" }
    password { "jedi123" }
  end

  factory :null_password_user, class: UserModel do
    full_name { "Test Skywalker" }
    email { "test#jedi.com" }
  end
end
