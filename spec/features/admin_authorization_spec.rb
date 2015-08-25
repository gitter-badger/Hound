require "rails_helper"

feature "Admin authorization" do
  scenario "admin accesses dashboard" do
    token = "usergithubtoken"
    user = create(:user, github_username: "admin_user")
    stub_repos_requests(token)
    allow(ENV).to receive(:fetch).
      with("ADMIN_GITHUB_HANDLES", "").
      and_return("admin_user,other_admin_user")

    sign_in_as(user, token)
    visit "/admin"

    expect(page).to have_content "Administrate"
  end

  scenario "non-admin cannot access dashboard" do
    token = "usergithubtoken"
    user = create(:user, github_username: "not_admin_user")
    stub_repos_requests(token)
    allow(ENV).to receive(:fetch).
      with("ADMIN_GITHUB_HANDLES", "").
      and_return("admin_user,other_admin_user")

    sign_in_as(user, token)
    visit "/admin"

    expect(page).not_to have_content "Administrate"
  end
end
