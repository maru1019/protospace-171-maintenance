FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    profile               {Faker::Lorem.sentence}
    occupation            {Faker::Team.name}
    position              {Faker::Team.name}
  end
end
