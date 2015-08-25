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

  ATTRIBUTE_TYPES = {
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

  def attribute_types
    ATTRIBUTE_TYPES
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
