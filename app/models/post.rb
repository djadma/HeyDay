class Post < ApplicationRecord
	mount_uploader :banner_image, BannerImageUploader
	has_many :comments, dependent: :destroy
  extend FriendlyId
  friendly_id :title, :use => [:slugged, :finders]
  scope :recent_post, -> { order('created_at DESC').limit(5) }
end
