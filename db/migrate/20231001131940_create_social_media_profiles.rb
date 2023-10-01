class CreateSocialMediaProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :social_media_profiles do |t|
      t.references :list_member, foreign_key: true
      t.string :platform, null: false, limit: 100
      t.string :profile_id, null: false
      t.timestamps
    end

    add_index :social_media_profiles, [:platform], name: "social_media_profiles_index"
  end
end
