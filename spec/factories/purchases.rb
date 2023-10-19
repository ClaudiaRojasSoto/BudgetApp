# spec/factories/purchases.rb
FactoryBot.define do
  factory :purchase do
    association :user
    name { 'MyPurchase' }
    amount { 1.5 }
    created_at { Time.now }

    transient do
      categories_count { 3 }
    end

    trait :with_categories do
      after(:create) do |purchase, evaluator|
        # Crea una lista de categorías y únelas a la compra
        categories = create_list(:category, evaluator.categories_count, user: purchase.user)
        purchase.categories << categories
      end
    end
  end
end
