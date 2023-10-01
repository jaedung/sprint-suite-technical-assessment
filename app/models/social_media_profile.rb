class SocialMediaProfile < ApplicationRecord
  belongs_to :list_member

  validates :platform, presence: true, length: { maximum: 100 }
  validates :profile_id, presence: true, length: { maximum: 255 }
end
