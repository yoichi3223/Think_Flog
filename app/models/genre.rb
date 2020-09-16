class Genre < ApplicationRecord
	has_many :lists,dependent: :destroy
	belongs_to :user
	enum status: {
		 true: 0,
	     false: 1
	},_prefix: true
end
