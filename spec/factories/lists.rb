FactoryBot.define do
  factory :list do
    list_type { %w[custom existing_table].sample }
    name { FFaker::Lorem.word }
  end
end
