require "stories_helper"

class SiteTest < Test::Unit::TestCase
  def test_webrat_style
    visit "/"
    assert_contain "Login"
  end

#  story "As a developer I want to see the homepage so I know Monk is correctly installed" do
#    scenario "A visitor goes to the homepage" do
#      visit "/"
#
#      assert_contain "Login"
#    end
#  end

end
