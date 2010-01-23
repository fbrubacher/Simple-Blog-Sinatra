require "stories_helper"

class SiteTest < Test::Unit::TestCase
  def test_webrat_style
    visit "/"
    assert_contain "Login"
  end
  
  def test_login
    User.create!(:email => "fbrubacher@adinet.com.uy", :password => "changeme")
    visit "/login"
    fill_in "email", :with => "fbrubacher@adinet.com.uy"  
    fill_in "password", :with => "changeme"  
    click_button "Login"  
    assert_contain "Logout"
  end


end
