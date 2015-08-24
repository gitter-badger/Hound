require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard

  # This method returns a hash
  # that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
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

  # This method returns an array of attributes
  # that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to remove the limit or customize the returned array.
  def table_attributes
    attributes.first(4)
  end

  # This method returns an array of attributes
  # that will be displayed on the model's show page
  def show_page_attributes
    attributes
  end

  # This method returns an array of attributes
  # that will be displayed on the model's form pages (`new` and `edit`)
  def form_attributes
    attributes - read_only_attributes
  end

  private

  def attributes
    [
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
  end

  def read_only_attributes
    [
      :id,
      :created_at,
      :updated_at,
    ]
  end
end
