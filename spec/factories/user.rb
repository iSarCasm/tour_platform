FactoryBot.define do
  factory :user do
    name  { Faker::Name.name }
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    base_role :customer

    factory :admin do
      base_role :admin

      factory :superadmin do
        after(:create) do |user|
          permission = create :permission
          role = create :role
          create :role_permission, role: role, permission: permission
          user.update!(role: role)
        end
      end
    end
  end
end
