# frozen_string_literal: true
FactoryBot.define do
  factory :event do
    description { Faker::Books::Dune.quote }
    start { Faker::Time.between(DateTime.now + 1, DateTime.now) }
    color {['black','green','red'].sample}
    user { nil }
  end
end
