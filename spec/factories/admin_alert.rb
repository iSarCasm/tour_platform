FactoryBot.define do
  factory :admin_alert do
    title 'Alert Title'
    content 'Alert content'
    read false
    user
  end
end
