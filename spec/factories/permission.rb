FactoryBot.define do
  factory :permission do
    action :manage
    subject_class :everything
  end
end
