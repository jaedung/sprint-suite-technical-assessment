include FactoryBot::Syntax::Methods

rand(5..10).times do
  list = create(:list)

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
