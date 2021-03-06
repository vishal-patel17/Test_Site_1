require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: 'vishal', email: 'vishal@example.com')
    @blog = Blog.new(blogname: 'first blog entry',
            description: 'this is the first blog entry for testing purpose only',
             user_id: '1')
  end

  test 'blog should be valid'do
    assert @blog.valid?
  end

  test 'user_id should be present' do
    @blog.user_id = nil
    assert_not @blog.valid?
  end

  test 'blogname should not be empty' do
    @blog.blogname = ' '
    assert_not @blog.valid?
  end

  test 'blogname should not be too long' do
    @blog.blogname = 'a'*101
    assert_not @blog.valid?

  end

  test 'blogname should not be too short' do
    @blog.blogname = 'aaaa'
    assert_not @blog.valid?

  end

  test 'blog description should not be empty' do
    @blog.description = ' '
    assert_not @blog.valid?
  end

  test 'blog description should not be too long' do
    @blog.description = 'a' * 5001
    assert_not @blog.valid?
  end

  test 'blog description should not be too short' do
    @blog.description = 'a' * 19
    assert_not @blog.valid?
  end



end