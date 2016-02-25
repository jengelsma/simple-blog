require 'test_helper'

class PostTest < ActiveSupport::TestCase

	def setup
		@post = Post.create(title: "a title goes here", article: "This is the actual text in an article", likes: 4)
	end

	test "post must be valid" do
		assert @post.valid? 
	end

	test "title must be present" do 
		@post.title = ""
		assert_not @post.valid?
	end


	test "title must not be too short" do 
		@post.title = "aa"
		assert_not @post.valid?
	end


	test "title must not be too long" do
		@post.title = "a" * 81
		assert_not @post.valid?
	end


	test "article must be present" do
		@post.article = ""
		assert_not @post.valid?
	end


	test "article must not be too short" do
		@post.article = "a"
		assert_not @post.valid?
	end


	test "article must not be too long" do
		@post.article = "a" * 601
		assert_not @post.valid?
	end


	test "likes must be postive" do
		@post.likes = -1
		assert_not @post.valid?
	end


	test "status must be valid" do
		invalid_statuses = [-10, -1, 2, 10]
		invalid_statuses.each do |is|
			begin 
				@post.status = is
				assert false, "#{is} should be invalid"
			rescue
				assert true
			end
		end
	end

end
