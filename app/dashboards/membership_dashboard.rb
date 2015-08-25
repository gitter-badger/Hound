require "administrate/base_dashboard"

class MembershipDashboard < Administrate::BaseDashboard
  ATTRIBUTES = [
    :id,
    :user_id,
    :repo_id,
    :created_at,
    :updated_at,
    :repo,
    :user,
  ]

  READ_ONLY_ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
  ]

  ATTRIBUTE_TYPES = {
    id: Field::String,
    user_id: Field::String,
    repo_id: Field::String,
    created_at: Field::String,
    updated_at: Field::String,
    repo: Field::BelongsTo,
    user: Field::BelongsTo,
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
