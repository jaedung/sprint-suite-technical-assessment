class ListMember < ApplicationRecord
  belongs_to :list
  
  validates :first_name, presence: true, length: { maximum: 100 }
  validates :last_name, presence: true, length: { maximum: 100 }
end
