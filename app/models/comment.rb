class Comment < ApplicationRecord
	belongs_to :post
	scope :recent_comment, -> { order('created_at DESC').limit(5) }
end
