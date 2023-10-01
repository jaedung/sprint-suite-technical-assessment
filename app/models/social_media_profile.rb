class SocialMediaProfile < ApplicationRecord
  belongs_to :list_member

  enum :platform, { twitter: 0, facebook: 1 }

  validates :platform, presence: true
  validates :profile_id, presence: true, length: { maximum: 255 }
end
