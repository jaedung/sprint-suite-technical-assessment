FactoryBot.define do
  factory :list do
    list_type { %w[custom existing_table].sample }
    name { FFaker::Company.unique.position }

    trait :custom do
      list_type { 'custom' }
    end

    trait :existing_table do
      list_type { 'existing_table' }
    end
  end
end
