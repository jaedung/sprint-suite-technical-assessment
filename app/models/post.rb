class Post < ApplicationRecord
  belongs_to :list_member

  enum :source, { twitter: 0, facebook: 1 }

  validates :source, presence: true
  validates :content, presence: true
  validates :posted_at, presence: true
end
