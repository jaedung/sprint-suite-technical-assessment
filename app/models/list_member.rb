class ListMember < ApplicationRecord
  belongs_to :list
  has_many :social_media_profiles
  has_many :posts
  
  validates :first_name, presence: true, length: { maximum: 100 }
  validates :last_name, presence: true, length: { maximum: 100 }
end
