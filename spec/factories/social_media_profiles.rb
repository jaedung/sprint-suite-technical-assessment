FactoryBot.define do
  factory :social_media_profiles do
    list_member { create(:list_member) }
    platform { %[facebook twitter].sample }
    profile_id { FFaker::Guid.guid }
  end
end
