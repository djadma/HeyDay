class Post < ApplicationRecord
	mount_uploader :banner_image, BannerImageUploader
	has_many :comments, dependent: :destroy
	default_scope { order(created_at: :desc) }
  scope :ordered_by_title, -> { reorder(title: :asc) }
  extend FriendlyId
  friendly_id :title, :use => [:slugged, :finders]
 
 def self.recent(max = 5)
    limit(max).order(created_at: :desc)
  end
end
