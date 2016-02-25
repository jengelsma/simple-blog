class Post < ActiveRecord::Base
	belongs_to :author
	
	validates :title,  presence: true, length: {minimum: 5, maximum: 80}
	validates :article, presence: true, length: {minimum: 20, maximum: 600}
	validates :likes, numericality: {greater_than_or_equal_to: 0}

	enum status: [:published, :unpublished]

end
