FactoryBot.define do
  factory :social_media_profile do
    list_member { create(:list_member) }
    platform { %w[twitter facebook].sample }
    profile_id { FFaker::Guid.guid }
  end
end
