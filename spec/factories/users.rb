FactoryBot.define do
  factory :user do
  name { 'user1' }
  email { 'example@example.com' }
  password { 'password' }
  password_confirmation { 'password' }
  admin { false }
  end
  factory :admin_user, class: User do
  name { 'admin_user' }
  email { 'admin@example.com' }
  password { '12345678' }
  password_confirmation { '12345678' }
  admin { true }
  end
end
