# frozen_string_literal: true

FactoryBot.define do
  factory :notification do
    title { Faker::Lorem.word }
    message { Faker::Lorem.sentence }
    read { false }
    user
  end
end
