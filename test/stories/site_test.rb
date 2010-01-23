require "stories_helper"

class SiteTest < Test::Unit::TestCase
  def test_webrat_style
    visit "/"
    assert_contain "Login"
  end
  
  def test_login
    visit "/login"
    fill_in "email", :with => "fbru02@yahoo.com.ar"  
    fill_in "password", :with => "jakobs"  
    click_button "Login"  
    assert_contain "Logout"
  end

#  story "As a developer I want to see the homepage so I know Monk is correctly installed" do
#    scenario "A visitor goes to the homepage" do
#      visit "/"
#
#      assert_contain "Login"
#    end
#  end

end
