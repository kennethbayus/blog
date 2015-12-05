class User <ActiveRecord:: Base
	has_many :posts

	validates :username, presence: true
	validates :printname, presence: true

end