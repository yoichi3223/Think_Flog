class List < ApplicationRecord
	  has_many :cards, -> { order(position: :asc) }, dependent: :destroy
	  belongs_to :user
	  belongs_to :genre
	  validates :title, presence: true, length: { in: 1..255 }
	  validates :genre_id, presence: true
end
