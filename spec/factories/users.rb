FactoryBot.define do
  factory :user do
    sequence(:email) { |n| Faker::Internet.email("#{Faker::Internet.user_name}#{n}") }
    crypted_password { Sorcery::CryptoProviders::BCrypt.encrypt('ABC123abc', 'salt') }
    salt { :salt }
    activation_state { :active }

    trait :on_pending do
      activation_state { :pending }
      activation_token { :activation_token }
    end
  end
end
