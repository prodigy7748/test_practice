FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name  { "Doe" }
    admin { false }
    email { 'aaa@aaa.com' }
    password { '111111' }
  end
end