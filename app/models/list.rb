class List < ApplicationRecord
  has_many :list_members

  validates :name, presence: true, uniqueness: true
end
