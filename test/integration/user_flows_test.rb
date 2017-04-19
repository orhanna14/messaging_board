require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  fixtures :users
  
  def test_login
    # get the login page
    get "/login"
    assert_equal 200, status

    # post the login and follow through to the home page
    post "/login", params: { username: users(:one).username,
      password: users(:one).password }
    #follow_redirect!
    assert_equal 200, status
    assert_equal "/articles/new", new_article_path
  end
end
