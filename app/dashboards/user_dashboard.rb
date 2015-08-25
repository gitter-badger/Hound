require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
    :github_username,
    :remember_token,
    :refreshing_repos,
    :email_address,
    :stripe_customer_id,
    :token,
    :memberships,
    :repos,
    :subscribed_repos,
    :subscriptions,
  ]

  READ_ONLY_ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
  ]

  def attribute_types
    {
      id: Field::String,
      created_at: Field::String,
      updated_at: Field::String,
      github_username: Field::String,
      remember_token: Field::String,
      refreshing_repos: Field::String,
      email_address: Field::String,
      stripe_customer_id: Field::String,
      token: Field::String,
      memberships: Field::HasMany,
      repos: Field::HasMany,
      subscribed_repos: Field::HasMany.with_options(class_name: "Repo"),
      subscriptions: Field::HasMany,
    }
  end

  def table_attributes
    ATTRIBUTES.first(4)
  end

  def show_page_attributes
    ATTRIBUTES
  end

  def form_attributes
    ATTRIBUTES - READ_ONLY_ATTRIBUTES
  end
end
