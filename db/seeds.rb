include FactoryBot::Syntax::Methods

def create_list_members(list)
  rand(10..20).times do
    list_member = create(:list_member, list: list)

    platforms = %w[twitter facebook]
    platforms.each do |platform|
      create(:social_media_profile, list_member: list_member, platform: platform)
    end

    sources = %w[twitter facebook]
    sources.each do |source|
      rand(20..30).times do
        create(:post, list_member: list_member, source: source)
      end
    end
  end
end

# custom list
rand(5..10).times do
  custom_list = create(:list, list_type: :custom, name: FFaker::Company.unique.position)
  create_list_members(custom_list)
end

# existing table list
rand(5..10).times do
  existing_table_list = create(:list, list_type: :existing_table, name: FFaker::Company.unique.position)
  create_list_members(existing_table_list)
end
