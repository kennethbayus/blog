class Comment <ActiveRecord:: Base
	belongs_to :post

	validates :body, presence: true
	validates :username, presence: true
	validates :email, presence: true
end