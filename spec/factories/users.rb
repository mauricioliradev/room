# frozen_string_literal: true
FactoryBot.define do
  factory :user do
    name { Faker::FunnyName.name }
    email { Faker::Internet.free_email}
    password {Faker::Internet.password(8)}
  end
end
