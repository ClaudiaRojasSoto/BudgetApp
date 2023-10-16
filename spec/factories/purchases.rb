FactoryBot.define do
  factory :purchase do
    association :user
    name { 'MyPurchase' }
    amount { 1.5 }
    created_at { Time.now }

    trait :with_categories do
      after(:create) do |purchase|
        create_list(:category, 3, purchases: [purchase])
      end
    end
  end
end
