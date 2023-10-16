FactoryBot.define do
  factory :category do
    name { 'MyCategory' }
    user

    after(:build) do |category|
      category.icon.attach(
        io: File.open(Rails.root.join('spec', 'support', 'assets', 'test_icon.png')),
        filename: 'test_icon.png',
        content_type: 'image/png'
      )
    end
  end
end
