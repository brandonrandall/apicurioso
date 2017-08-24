require 'rails_helper'

describe "User Dashboard" do
  scenario "a user can log into github" do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      extra:
        { raw_info:
          {
            avatar_url: "https://avatars2.githubusercontent.com/u/17730886?v=4"
          }
        },
      provider: 'github',
      uid: "1234",
      credentials:
        { token: "pizza",
          secret: "secretpizza"
        },
      info:
        { nickname: "brandonrandall",
        }
    })
    VCR.use_cassette("user_logs_in") do
      visit "/"
      expect(page.status_code).to eq(200)
      click_link "Sign in with Github"
      expect(current_path).to eq("/dashboard")
      expect(page).to have_content("brandonrandall")
      expect(page).to have_link("Logout")
    end
  end

  scenario "a user can view basic info about an account" do
    VCR.use_cassette("user_views_dashboard") do
      user = User.new(oauth_token: ENV["github_user_token"])
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit "/dashboard"

      within ".followers" do
        expect(page).to have_content("3 followers")
        expect(page).to have_css(".follower", count: 3)
      end
    end
  end
end
