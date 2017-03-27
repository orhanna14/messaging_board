require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
 
 
 def setup
   @user = User.create(username: "bob", email: "bob@example.com")
   @article = @user.articles.build(title: "Bacon pancakes", text: "Writin' about makin' bacon pancakes")
   
 end
 
  test "article should be valid" do
    assert @article.valid? 
  end
  
  test "user_id should be present" do
    @article.user_id = nil
    assert_not @article.valid?
  end
  
  test "title should be present" do
    @article.title = " "
    assert_not @article.valid?
  end
  
  test "title length should not be too short" do
    @article.title = "aaaa"
     assert_not @article.valid?
  end
  
  test "title length should not be too long" do
     @article.title = "a" * 101
     assert_not @article.valid?
  end 
  
  test "article should be present" do
    @article.text = " "
    assert_not @article.valid? 
  end
  
  test "article length should not be too short" do
    @article.text = "a" * 9
    assert_not @article.valid?
  end
  
  test "article length should not be too long" do
     @article.text = "a" * 150
    assert_not @article.valid?
  end
end
