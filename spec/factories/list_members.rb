FactoryBot.define do
  factory :list_members do
    list { create(:list) }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
  end
end
