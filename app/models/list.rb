class List < ApplicationRecord
	has_many :cards,-> { order(position: :asc) },dependent: :destroy
	belongs_to :user
	belongs_to :genre
	validates :title,length:{in: 1..255}
end
