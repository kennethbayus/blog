class Post <ActiveRecord:: Base
	serialize :photos
	has_many :comments
	belongs_to :user

	mount_uploaders :photos, PhotoUploader

	validates :title, presence: true, uniqueness: true
	validates :body, presence: true
end