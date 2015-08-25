require "administrate/base_dashboard"

class RepoDashboard < Administrate::BaseDashboard
  ATTRIBUTES = [
    :id,
    :github_id,
    :active,
    :hook_id,
    :full_github_name,
    :created_at,
    :updated_at,
    :private,
    :in_organization,
    :owner_id,
    :builds,
    :memberships,
    :owner,
    :subscription,
    :users,
  ]

  READ_ONLY_ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
    :subscription,
  ]

  # This method returns a hash
  # that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  def attribute_types
    {
      id: Field::String,
      github_id: Field::String,
      active: Field::String,
      hook_id: Field::String,
      full_github_name: Field::String,
      created_at: Field::String,
      updated_at: Field::String,
      private: Field::String,
      in_organization: Field::String,
      owner_id: Field::String,
      builds: Field::HasMany,
      memberships: Field::HasMany,
      owner: Field::BelongsTo,
      subscription: Field::HasOne,
      users: Field::HasMany,
    }
  end

  # This method returns an array of attributes
  # that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to remove the limit or customize the returned array.
  def table_attributes
    ATTRIBUTES.first(4)
  end

  # This method returns an array of attributes
  # that will be displayed on the model's show page
  def show_page_attributes
    ATTRIBUTES
  end

  # This method returns an array of attributes
  # that will be displayed on the model's form pages (`new` and `edit`)
  def form_attributes
    ATTRIBUTES - READ_ONLY_ATTRIBUTES
  end
end
