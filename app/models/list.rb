class List < ApplicationRecord
  has_many :list_members

  enum :list_type, { custom: 0, existing_table: 1 }

  validates :list_type, presence: true
  validates :name, presence: true, uniqueness: true
end
