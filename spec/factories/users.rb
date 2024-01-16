# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username  { Faker::Name.name }
		email { Faker::Internet.email }
		birthdate { "18/08/1994" }
		ddd { "11" }
		phone { "953736223" }
		document { "60167014242" }
		password { "12345678" }
		password_confirmation { "12345678" }
  end
end