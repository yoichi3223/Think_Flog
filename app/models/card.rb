class Card < ApplicationRecord
  belongs_to :list
  acts_as_list scope: :list
  validates :title, length: { in: 1..255 }
  validates :memo, length: { maximum: 1000 }
  validates :list_id, presence: true
end
