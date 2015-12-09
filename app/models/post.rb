class Post <ActiveRecord:: Base

	has_many :comments
	belongs_to :user

	mount_uploader :photo, PhotoUploader

	validates :title, presence: true, uniqueness: true
	validates :body, presence: true
end