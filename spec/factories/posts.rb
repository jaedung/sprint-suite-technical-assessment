FactoryBot.define do
  factory :post do
    list_member { create(:list_member) }
    source { %w[twitter facebook].sample }
    content { FFaker::Lorem.paragraph }
    posted_at { rand(1..60).days.ago }
  end
end
