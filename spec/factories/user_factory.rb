# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name { 'Doe' }
    email { Faker::Internet.email }
    password { 'password123' }
  end
end
