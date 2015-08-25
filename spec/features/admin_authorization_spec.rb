require "rails_helper"

feature "Admin authorization" do
  scenario "admin accesses dashboard" do
    ENV["ADMIN_GITHUB_HANDLES"] = "admin_user,other_admin_user"
    stub_repos_requests(token)
    admin = create(:user, github_username: "admin_user")

    sign_in_as(admin, token)
    visit admin_users_path

    expect(page).to have_admin_users_header

    ENV["ADMIN_GITHUB_HANDLES"] = nil
  end

  scenario "non-admin cannot access dashboard" do
    ENV["ADMIN_GITHUB_HANDLES"] = "admin_user,other_admin_user"
    stub_repos_requests(token)
    non_admin = create(:user, github_username: "not_admin_user")

    sign_in_as(non_admin, token)
    visit admin_users_path

    expect(page).not_to have_admin_users_header

    ENV["ADMIN_GITHUB_HANDLES"] = nil
  end

  def have_admin_users_header
    have_selector("h1", text: "Users")
  end

  def token
    "usergithubtoken"
  end
end
